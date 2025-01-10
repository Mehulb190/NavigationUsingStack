import SwiftUI

// MARK: - Authentication Routes
enum AuthenticationRoute: Hashable {
    case login
    case forgotPassword
    case signUp
    case emailSent // Add new route
}

class AuthenticationRouter: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: AuthenticationRoute) {
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
    func view(for route: AuthenticationRoute) -> some View {
        switch route {
        case .login:
            LoginView()
                .navigationBarBackButtonHidden(true)
        case .forgotPassword:
            ForgotPasswordView()
                .withBackButton(action: navigateBack)
        case .signUp:
            SignUpView()
                .withBackButton(action: navigateBack)
        case .emailSent:
            EmailSuccessfullySentView()
                .withBackButton(action: navigateBack)
        }
    }
    
    @ViewBuilder
    func rootView() -> some View {
        LoginView()
    }
}
