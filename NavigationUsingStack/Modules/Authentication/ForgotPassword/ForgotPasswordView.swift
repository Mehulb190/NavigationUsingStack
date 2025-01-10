import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var router: AuthenticationRouter
    @StateObject private var viewModel = ForgotPasswordViewModel()
    
    var body: some View {
        ZStack {
            // Background remains the same
            GradientBackgroundView()
            
            VStack(spacing: 20) {
                Text("Reset Password")
                    .font(.system(size: 24, weight: .bold))
                
                Text("Enter your email address to receive password reset instructions")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                CustomTextField(iconName: "envelope",
                              placeholder: "Email",
                              isSecure: false,
                              text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                    .padding(.horizontal, 20)
                
                AppPrimaryButton(
                    title: "Send Reset Link",
                    isLoading: viewModel.isLoading
                ) {
                    viewModel.resetPassword { success in
                        if success {
                            // Navigate to success view instead of going back
                            router.navigate(to: .emailSent)
                        }
                    }
                }
            }
            .padding(.top, 50)
        }
        .alert("Error", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage)
        }
        .navigationTitle("Forgot Password")
        .navigationBarTitleDisplayMode(.inline)
    }
}
