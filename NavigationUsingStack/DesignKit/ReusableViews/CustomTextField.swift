//
//  CustomTextField.swift
//  NavigationUsingStack
//
//  Created by Mehul Chauhan on 09/01/25.
//

import SwiftUI

struct CustomTextField: View {
    let iconName: String
    let placeholder: String
    let isSecure: Bool
    @Binding var text: String
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: iconName)
                .foregroundColor(.gray)
            
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
    }
}
