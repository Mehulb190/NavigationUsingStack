import SwiftUI

/*
 Note: deep link urls
 1. app://home
 2. app://profile
 3. app://settings
 4. app://change-password
*/

// MARK: - DeepLink
enum DeepLink {
    case home
    case profile
    case settings
    case productDetail(id: String)
    case changePassword
    
    init?(url: URL) {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: true),
              let host = components.host else {
            return nil
        }
        
        switch host {
        case "home":
            self = .home
        case "profile":
            self = .profile
        case "settings":
            self = .settings
        case "change-password":
            self = .changePassword
        case "product":
            if let productId = components.queryItems?.first(where: { $0.name == "id" })?.value {
                self = .productDetail(id: productId)
            } else {
                return nil
            }
        default:
            return nil
        }
    }
}

// MARK: - DeepLinkManager
class DeepLinkManager: ObservableObject {
    static let shared = DeepLinkManager()
    
    @Published var currentDeepLink: DeepLink?
    private var pendingDeepLink: DeepLink?
    
    private init() {}
    
    func handleDeepLink(url: URL, isLoggedIn: Bool) {
        guard let deepLink = DeepLink(url: url) else { return }
        
        if isLoggedIn {
            // If user is logged in, process the deep link immediately
            currentDeepLink = deepLink
        } else {
            // If user is not logged in, store the deep link for later
            pendingDeepLink = deepLink
        }
    }
    
    func processPendingDeepLink() {
        if let pending = pendingDeepLink {
            currentDeepLink = pending
            pendingDeepLink = nil
        }
    }
    
    func clearPendingDeepLink() {
        pendingDeepLink = nil
    }
}
