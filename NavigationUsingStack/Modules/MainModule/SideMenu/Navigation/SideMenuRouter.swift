import SwiftUI
import Combine

// MARK: - Side Menu Router
class SideMenuRouter: ObservableObject {
    @Published var selectedMenuItem: SideMenuItem = .home
    @Published var isMenuOpen = false
    
    // Reference to child routers
    private var profileRouter: ProfileRouter?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupDeepLinkHandling()
    }
    
    func setProfileRouter(_ router: ProfileRouter) {
        self.profileRouter = router
    }
    
    func toggleMenu() {
        isMenuOpen.toggle()
    }
    
    func selectMenuItem(_ item: SideMenuItem) {
        selectedMenuItem = item
    }
    
    private func setupDeepLinkHandling() {
        DeepLinkManager.shared.$currentDeepLink
            .compactMap { $0 }
            .sink { [weak self] deepLink in
                self?.handleDeepLink(deepLink)
            }
            .store(in: &cancellables)
    }
    
    private func handleDeepLink(_ deepLink: DeepLink) {
        switch deepLink {
        case .home:
            selectMenuItem(.home)
        case .profile:
            selectMenuItem(.profile)
        case .settings:
            selectMenuItem(.settings)
        case .changePassword:
            selectMenuItem(.profile)
            // Wait for next render cycle to ensure profile view is loaded
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
                self?.profileRouter?.navigate(to: .changePassword)
            }
        case .productDetail(let id):
            // Handle product detail navigation
            print("Navigate to product with ID: \(id)")
        }
        
        // Reset the deep link after handling
        DeepLinkManager.shared.currentDeepLink = nil
    }
}
