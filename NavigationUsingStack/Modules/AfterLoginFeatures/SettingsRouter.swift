import SwiftUI

// MARK: - Settings Routes
enum SettingsRoute: Hashable {
    case notifications
    case privacy
    case about
}

class SettingsRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: SettingsRoute) {
        path.append(route)
    }
    
    func navigateBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func clearNavigation() {
        path = NavigationPath()
    }
    
    @ViewBuilder
    func view(for route: SettingsRoute) -> some View {
        switch route {
        case .notifications:
            Text("Notifications Settings")
                .navigationTitle("Notifications")
                .withBackButton(action: navigateBack)
        case .privacy:
            Text("Privacy Settings")
                .navigationTitle("Privacy")
                .withBackButton(action: navigateBack)
        case .about:
            Text("About App")
                .navigationTitle("About")
                .withBackButton(action: navigateBack)
        }
    }
    
    @ViewBuilder
    func rootView() -> some View {
        List {
            Button("Notifications") { self.navigate(to: .notifications) }
            Button("Privacy") { self.navigate(to: .privacy) }
            Button("About") { self.navigate(to: .about) }
        }
        .navigationTitle("Settings")
    }
}
