//
//  NavigationUsingStackApp.swift
//  NavigationUsingStack
//
//  Created by Mehul Chauhan on 07/01/25.
//

import SwiftUI

@main
struct NavigationUsingStackApp: App {
    @StateObject private var appState = AppState() // Shared app state
    
    var body: some Scene {
        WindowGroup {
            RootViewSwitcher()
                .environmentObject(appState)
                .onOpenURL { url in
                    DeepLinkManager.shared.handleDeepLink(url: url, isLoggedIn: appState.isLoggedIn)
                }
        }
    }
}
