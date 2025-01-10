import SwiftUI

struct SideMenuToggleButton: ToolbarContent {
    @EnvironmentObject private var sideMenuRouter: SideMenuRouter
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            if horizontalSizeClass == .compact {
                Button(action: { sideMenuRouter.toggleMenu() }) {
                    Image(systemName: "line.3.horizontal")
                }
            }
        }
    }
}
