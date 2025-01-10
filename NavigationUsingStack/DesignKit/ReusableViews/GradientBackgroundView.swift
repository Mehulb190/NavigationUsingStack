import SwiftUI

struct GradientBackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                     startPoint: .topLeading,
                     endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

