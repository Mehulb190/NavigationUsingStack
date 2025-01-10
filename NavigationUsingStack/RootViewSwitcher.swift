//
//  AppState.swift
//  NavigationUsingStack
//
//  Created by Mehul Chauhan on 09/01/25.
//

import SwiftUI

struct RootViewSwitcher: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        Group {
            if appState.isLoggedIn {
                SideMenuWithMainContentView()
                    .environmentObject(appState)
            } else {
                LoginView()
                    .environmentObject(appState)
            }
        }
    }
}
