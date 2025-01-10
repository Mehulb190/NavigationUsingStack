//
//  AppState.swift
//  NavigationUsingStack
//
//  Created by Mehul Chauhan on 09/01/25.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false // Controls the root view

    func login() {
        isLoggedIn = true
        // Process any pending deep links after successful login
        DeepLinkManager.shared.processPendingDeepLink()
    }
    
    func logout() {
        isLoggedIn = false
        // Clear any pending deep links when logging out
        DeepLinkManager.shared.clearPendingDeepLink()
    }
}

/*
 
 Note: We can also add enum to have more states eg. isIntroCompleted, onBoardingCompleted, etc.
 
 Use enums if there are more than 2 states.
 
*/
