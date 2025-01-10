import SwiftUI

struct EmailSuccessfullySentView: View {
    @EnvironmentObject var router: AuthenticationRouter
    
    var body: some View {
        ZStack {
            // Add gradient background
            GradientBackgroundView()
            
            VStack(spacing: 30) {
                // Success icon
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                
                // Success message
                Text("Email Sent Successfully!")
                    .font(.system(size: 24, weight: .bold))
                
                Text("Please check your email for password reset instructions.")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                
                // Back to login button
                AppPrimaryButton(
                    title: "Back to Login",
                    isLoading: false
                ) {
                    // Clear the navigation stack and return to login
                    router.clearNavigation()
                }
            }
            .padding(.horizontal, 20)
        }
        .navigationBarBackButtonHidden(true)
    }
}

