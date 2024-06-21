//
//  PasswordView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 17/06/24.
//

import SwiftUI

struct PasswordView: View {
    
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    func isButtonDisabled() -> Bool {
        return (password.isEmpty || password.count < 8) || (confirmPassword.isEmpty || confirmPassword.count < 8) || password != confirmPassword
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 24) {
                
                Spacer()
                
                Image(systemName: "music.note.list")
                    .font(.system(size: 160))
                    .foregroundColor(.orange1)
                
                Spacer()

                VStack(spacing: 12) {
                    TxtField(text: $password, placeholder: "Enter password", cornerRadius: 15, isSecure: true)
                    TxtField(text: $confirmPassword, placeholder: "Confirm password", cornerRadius: 15, isSecure: true)
                }
                
                VStack {
                    Button(action: {
                        // action
                    }) {
                        NavLink(text: "Signup", cornerRadius: 15)
                    }
                    .disabled(isButtonDisabled())
                    .opacity(isButtonDisabled() ? 0.5 : 1)
                    
                }
            }
            .padding(EdgeInsets(top: 24, leading: 16, bottom: 16, trailing: 16))
        }
        .scrollIndicators(.hidden)
        .navigationTitle("Set password")
        .onDisappear {
            password = ""
            confirmPassword = ""
        }
    }
}

#Preview {
    PasswordView()
}

