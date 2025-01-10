//
//  SideMenuItem.swift
//  NavigationUsingStack
//
//  Created by Mehul Chauhan on 09/01/25.
//

import Foundation

// MARK: - Side Menu Routes
enum SideMenuItem: String, CaseIterable {
    case home = "Home"
    case profile = "Profile"
    case likes = "Likes"
    case settings = "Settings"
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .profile: return "person"
        case .likes: return "heart"
        case .settings: return "gear"
        }
    }
}
