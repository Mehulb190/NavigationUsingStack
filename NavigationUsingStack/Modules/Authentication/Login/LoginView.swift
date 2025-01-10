import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @StateObject private var authRouter = AuthenticationRouter()

    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            // Background gradient
            GradientBackgroundView()
            
            // Main content
            ScrollView {
                VStack(spacing: 30) {
                    // Logo and welcome text
                    VStack(spacing: 20) {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .foregroundColor(.blue)
                        
                        Text("Welcome Back!")
                            .font(.system(size: 32, weight: .bold))
                        
                        Text("Login to continue")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 50)
                    
                    // Login form
                    VStack(spacing: 20) {
                        // Email field
                        CustomTextField(iconName: "envelope",
                                      placeholder: "Email",
                                      isSecure: false,
                                      text: $viewModel.email)
                            .textInputAutocapitalization(.never)
                        
                        // Password field
                        CustomTextField(iconName: "lock",
                                      placeholder: "Password",
                                      isSecure: true,
                                      text: $viewModel.password)
                        
                        // Forgot Password button
                        Button(action: {
                            authRouter.navigate(to: .forgotPassword)
                        }) {
                            Text("Forgot Password?")
                                .foregroundColor(.blue)
                                .font(.system(size: 14))
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.horizontal, 20)
                    
                    // Replace login button with new AppPrimaryButton component
                    AppPrimaryButton(
                        title: "Login",
                        isLoading: viewModel.isLoading
                    ) {
                        viewModel.login { success in
                            if success {
                                appState.login()
                                
                            }
                        }
                    }
                    
                    // Sign Up section
                    HStack {
                        Text("Don't have an account?")
                            .foregroundColor(.gray)
                        Button("Sign Up") {
                            authRouter.navigate(to: .signUp)
                        }
                        .foregroundColor(.blue)
                    }
                    .font(.system(size: 14))
                    
                    Spacer(minLength: 50)
                }
            }
            .padding(.top, 50)
        }
        .alert("Error", isPresented: $viewModel.showError) {
            Button("OK", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage)
        }
    }
}
