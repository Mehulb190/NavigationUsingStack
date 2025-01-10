import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var router: AuthenticationRouter
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        ZStack {
            // Add gradient background
            GradientBackgroundView()
            
            VStack(spacing: 20) {
                Text("Create Account")
                    .font(.system(size: 24, weight: .bold))
                
                CustomTextField(iconName: "person",
                              placeholder: "Full Name",
                              isSecure: false,
                              text: $viewModel.fullName)
                
                CustomTextField(iconName: "envelope",
                              placeholder: "Email",
                              isSecure: false,
                              text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                
                CustomTextField(iconName: "lock",
                              placeholder: "Password",
                              isSecure: true,
                              text: $viewModel.password)
                
                AppPrimaryButton(
                    title: "Sign Up",
                    isLoading: viewModel.isLoading
                ) {
                    viewModel.signUp { success in
                        if success {
                            router.navigateBack()
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.top, 50)
        }
        .alert("Error", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage)
        }
        .navigationTitle("Sign Up")
        .navigationBarTitleDisplayMode(.inline)
    }
}
