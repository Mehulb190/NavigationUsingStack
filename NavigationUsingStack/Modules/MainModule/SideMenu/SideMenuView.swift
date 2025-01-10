import SwiftUI

struct SideMenuView: View {
    @EnvironmentObject private var sideMenuRouter: SideMenuRouter
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @EnvironmentObject var appState: AppState

    var body: some View {
        List {
            ForEach(SideMenuItem.allCases, id: \.self) { item in
                Button(action: {
                    sideMenuRouter.selectMenuItem(item)
                    if horizontalSizeClass == .compact {
                        sideMenuRouter.toggleMenu()
                    }
                }) {
                    HStack {
                        Image(systemName: item.iconName)
                        Text(item.rawValue)
                    }
                }
                .foregroundColor(sideMenuRouter.selectedMenuItem == item ? .blue : .primary)
            }
            
            Button(action: { appState.logout() }) {
                HStack {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                    Text("Logout")
                }
                .foregroundColor(.red)
            }
        }
        .background(Color(.systemBackground))
    }
}
