//
//  HomeScreens.swift
//  NavigationUsingStack
//
//  Created by Mehul Chauhan on 07/01/25.
//

import SwiftUI

struct ScreenA: View {
    @EnvironmentObject var router: HomeRouter
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Button("Go to Screen B") {
                router.navigateToMainRoute(.screenB)
            }
        }
        .navigationTitle("Home")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    appState.logout()
                }) {
                    Text("Logout")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

struct ScreenB: View {
    @EnvironmentObject var router: HomeRouter
    
    var body: some View {
        Button("Go to Screen C") {
            router.navigateToMainRoute(.screenC)
        }
        .navigationTitle("Screen B")
    }
}

struct ScreenC: View {
    @EnvironmentObject var router: HomeRouter
    
    var body: some View {
        Button("Go to Screen D") {
            router.navigateToMainRoute(.screenD)
        }
        .navigationTitle("Screen C")
    }
}

struct ScreenD: View {
    @EnvironmentObject var router: HomeRouter
    
    var body: some View {
        VStack {
            Text("Screen D")
                .font(.title)
            
            Button("Present New Stack (Screen 1)") {
                router.presentNewStack()
            }
        }
        .sheet(isPresented: $router.isPresentingStack) {
            PresentedStackView()
        }
        .navigationTitle("Screen D")
    }
}
