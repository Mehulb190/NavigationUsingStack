import SwiftUI

struct SideMenuWithMainContentView: View {
    @StateObject private var sideMenuRouter = SideMenuRouter()
    @EnvironmentObject var appState: AppState

    // Add environment values for size class and horizontal size class
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Main Content
                HStack(spacing: 0) {
                    // Show side menu permanently for iPad in regular size class
                    if horizontalSizeClass == .regular {
                        SideMenuView()
                            .frame(width: 320)
                            .background(Color(.systemBackground))
                            .frame(minHeight: 0, maxHeight: .infinity)
                    }
                    
                    // Content Area
                    MainAppContentView()
                        .frame(maxWidth: .infinity)
                        .environmentObject(sideMenuRouter)
                }
                
                // Only show overlay for iPhone/compact size class
                if horizontalSizeClass == .compact && sideMenuRouter.isMenuOpen {
                    Color.black
                        .opacity(0.3)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                sideMenuRouter.toggleMenu()
                            }
                        }
                }
                
                // Side Menu - only for iPhone/compact size class
                if horizontalSizeClass == .compact {
                    HStack(spacing: 0) {
                        if sideMenuRouter.isMenuOpen {
                            SideMenuView()
                                .frame(width: geometry.size.width * 0.7)
                                .transition(.move(edge: .leading))
                        }
                        Spacer()
                    }
                    .animation(.easeInOut, value: sideMenuRouter.isMenuOpen)
                }
            }
            .environmentObject(sideMenuRouter)
            .environmentObject(appState)
        }
    }
}
