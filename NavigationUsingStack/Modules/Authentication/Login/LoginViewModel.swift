import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage = ""
    @Published var showError = false
    
    func login(completion: @escaping (Bool) -> Void) {
        isLoading = true
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }
            
//            // Basic validation
//            if self.email.isEmpty || self.password.isEmpty {
//                self.errorMessage = "Please fill in all fields"
//                self.showError = true
//                self.isLoading = false
//                completion(false)
//                return
//            }
//            
//            // Email validation
//            if !self.isValidEmail(self.email) {
//                self.errorMessage = "Please enter a valid email"
//                self.showError = true
//                self.isLoading = false
//                completion(false)
//                return
//            }
//            
//            // Password validation
//            if self.password.count < 6 {
//                self.errorMessage = "Password must be at least 6 characters"
//                self.showError = true
//                self.isLoading = false
//                completion(false)
//                return
//            }
            
            // Simulate successful login
            self.isLoading = false
            completion(true)
        }
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

