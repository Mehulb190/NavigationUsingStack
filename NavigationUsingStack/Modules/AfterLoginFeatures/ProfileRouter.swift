import SwiftUI

// MARK: - Profile Routes
enum ProfileRoute: Hashable {
    case editProfile
    case changePassword
}

class ProfileRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: ProfileRoute) {
        path.append(route)
    }
    
    func navigateBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    @ViewBuilder
    func view(for route: ProfileRoute) -> some View {
        switch route {
        case .editProfile:
            Text("Edit Profile View")
                .navigationTitle("Edit Profile")
                .withBackButton(action: navigateBack)
        case .changePassword:
            Text("Change Password View")
                .navigationTitle("Change Password")
                .withBackButton(action: navigateBack)
        }
    }
    
    @ViewBuilder
    func rootView() -> some View {
        VStack {
            Text("Profile View")
            Button("Edit Profile") {
                self.navigate(to: .editProfile)
            }
            Button("Change Password") {
                self.navigate(to: .changePassword)
            }
        }
        .navigationTitle("Profile")
    }
}
