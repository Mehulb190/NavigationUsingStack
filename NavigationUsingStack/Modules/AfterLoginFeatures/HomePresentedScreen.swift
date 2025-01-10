//
//  PresentedScreen.swift
//  NavigationUsingStack
//
//  Created by Mehul Chauhan on 07/01/25.
//

import SwiftUI

// MARK: - Presented Stack (Screens 1 -> 2 -> 3)
struct PresentedStackView: View {
    @EnvironmentObject var homeRouter: HomeRouter
    @StateObject private var presentedRouter: PresentedHomeRouter
    
    init() {
        self._presentedRouter = StateObject(wrappedValue: PresentedHomeRouter(dismissAction: {
            NotificationCenter.default.post(name: .dismissPresentedStack, object: nil)
        }))
    }
    
    var body: some View {
        NavigationStack(path: $presentedRouter.presentedPath) {
            presentedRouter.rootView()
                .navigationDestination(for: PresentedScreen.self) { screen in
                    presentedRouter.view(for: screen)
                }
        }
        .environmentObject(presentedRouter)
        .onAppear {
            NotificationCenter.default.addObserver(forName: .dismissPresentedStack, object: nil, queue: .main) { _ in
                homeRouter.dismissPresentedStack()
            }
        }
    }
}

struct Screen1: View {
    @EnvironmentObject var router: PresentedHomeRouter
    
    var body: some View {
        VStack {
            Text("Screen 1")
            Button("Go to Screen 2") {
                router.navigateToPresentedScreen(.screen2)
            }
        }
        .navigationTitle("Screen 1")
    }
}

struct Screen2: View {
    @EnvironmentObject var router: PresentedHomeRouter
    
    var body: some View {
        VStack {
            Text("Screen 2")
            Button("Go to Screen 3") {
                router.navigateToPresentedScreen(.screen3)
            }
        }
        .navigationTitle("Screen 2")
    }
}

struct Screen3: View {
    @EnvironmentObject var router: PresentedHomeRouter
    
    var body: some View {
        VStack {
            Text("Screen 3")
                .font(.title)
            
            Button("Dismiss Stack") {
                router.dismissPresentedStack()
            }
        }
        .navigationTitle("Screen 3")
    }
}

extension Notification.Name {
    static let dismissPresentedStack = Notification.Name("dismissPresentedStack")
}
