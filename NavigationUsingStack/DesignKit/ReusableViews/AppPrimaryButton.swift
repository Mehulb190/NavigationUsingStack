import SwiftUI

struct AppPrimaryButton: View {
    let title: String
    let isLoading: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
            } else {
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]),
                         startPoint: .leading,
                         endPoint: .trailing)
        )
        .foregroundColor(.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
        .disabled(isLoading)
        .padding(.horizontal, 20)
    }
}
