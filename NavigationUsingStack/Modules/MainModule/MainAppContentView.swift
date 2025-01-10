//
//  MainAppContentView.swift
//  NavigationUsingStack
//
//  Created by Mehul Chauhan on 09/01/25.
//

import SwiftUI

struct MainAppContentView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var sideMenuRouter: SideMenuRouter

    @StateObject private var homeRouter = HomeRouter()
    @StateObject private var profileRouter = ProfileRouter()
    @StateObject private var likesRouter = LikesRouter()
    @StateObject private var settingsRouter = SettingsRouter()
        
    var body: some View {
        ZStack {
            Color.clear
                .onAppear {
                    sideMenuRouter.setProfileRouter(profileRouter)
                }
            
            switch sideMenuRouter.selectedMenuItem {
            case .home:
                NavigationStack(path: $homeRouter.mainPath) {
                    homeRouter.rootView()
                        .navigationDestination(for: HomeRoute.self) { route in
                            homeRouter.view(for: route)
                        }
                        .toolbar { SideMenuToggleButton() }
                }
                .environmentObject(appState)
                .environmentObject(homeRouter)
                .environmentObject(sideMenuRouter)
            case .profile:
                NavigationStack(path: $profileRouter.path) {
                    profileRouter.rootView()
                        .navigationDestination(for: ProfileRoute.self) { route in
                            profileRouter.view(for: route)
                        }
                        .toolbar { SideMenuToggleButton() }
                }
                .environmentObject(profileRouter)
                .environmentObject(sideMenuRouter)
            case .likes:
                NavigationStack(path: $likesRouter.path) {
                    likesRouter.rootView()
                        .navigationDestination(for: LikesRoute.self) { route in
                            likesRouter.view(for: route)
                        }
                        .toolbar { SideMenuToggleButton() }
                }
                .environmentObject(likesRouter)
                .environmentObject(sideMenuRouter)
            case .settings:
                NavigationStack(path: $settingsRouter.path) {
                    settingsRouter.rootView()
                        .navigationDestination(for: SettingsRoute.self) { route in
                            settingsRouter.view(for: route)
                        }
                        .toolbar { SideMenuToggleButton() }
                }
                .environmentObject(settingsRouter)
                .environmentObject(sideMenuRouter)
            }
        }
    }
}
