import SwiftUI

// MARK: - Main Navigation Routes
enum HomeRoute: Hashable {
    case screenB
    case screenC
    case screenD
}

// MARK: - Presented Screen Routes
enum PresentedScreen: Hashable {
    case screen2
    case screen3
}

// MARK: - Home Router
class HomeRouter: ObservableObject {
    @Published var mainPath = NavigationPath()
    @Published var isPresentingStack = false
    @Published var isLoggedIn = false
    
    // Main stack navigation
    func navigateToMainRoute(_ route: HomeRoute) {
        mainPath.append(route)
    }
    
    // Present new stack
    func presentNewStack() {
        isPresentingStack = true
    }
    
    // Dismiss presented stack
    func dismissPresentedStack() {
        isPresentingStack = false
    }
    
    // Clear main navigation
    func clearNavigation() {
        mainPath = NavigationPath()
        isPresentingStack = false
    }
    
    // Logout
    func logout() {
        isLoggedIn = false
        clearNavigation()
    }
    
    // Pop back one screen
    func popBack() {
        if !mainPath.isEmpty {
            mainPath.removeLast()
        }
    }
    
    // View builder for main navigation
    @ViewBuilder
    func view(for route: HomeRoute) -> some View {
        switch route {
        case .screenB:
            ScreenB()
                .withBackButton(action: popBack)
        case .screenC:
            ScreenC()
                .withBackButton(action: popBack)
        case .screenD:
            ScreenD()
                .withBackButton(action: popBack)
        }
    }
    
    // Root view
    @ViewBuilder
    func rootView() -> some View {
        ScreenA()
    }
}

// MARK: - Presented Home Router
class PresentedHomeRouter: ObservableObject {
    @Published var presentedPath = NavigationPath()
    private var dismissAction: () -> Void
    
    init(dismissAction: @escaping () -> Void) {
        self.dismissAction = dismissAction
    }
    
    // Presented stack navigation
    func navigateToPresentedScreen(_ screen: PresentedScreen) {
        presentedPath.append(screen)
    }
    
    // Add navigateBack function
    func navigateBack() {
        if !presentedPath.isEmpty {
            presentedPath.removeLast()
        }
    }
    
    // Dismiss presented stack
    func dismissPresentedStack() {
        dismissAction()
        presentedPath = NavigationPath()
    }
    
    // View builder for presented navigation
    @ViewBuilder
    func view(for screen: PresentedScreen) -> some View {
        switch screen {
        case .screen2:
            Screen2()
                .withBackButton(action: navigateBack)
        case .screen3:
            Screen3()
                .withBackButton(action: navigateBack)
        }
    }
    
    // Root view for presented stack
    @ViewBuilder
    func rootView() -> some View {
        Screen1()
            .withBackButton(isClose: true, action: dismissPresentedStack)
    }
}
