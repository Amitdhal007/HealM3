//
//  LoginView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 17/06/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    func isButtonDisabled() -> Bool {
        return (email.isEmpty || !email.contains("gmail.com")) || password.count < 8
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 24) {
                
                Spacer()
                
                Image(systemName: "music.note.list")
                    .font(.system(size: 160))
                    .foregroundColor(.orange1)
                
                Spacer()

                VStack(alignment:.leading){
                    Text("Welcome,")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Please enter your details to continue")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
                
                
                VStack {
                    TxtField(text: $email, placeholder: "Enter E-mail", cornerRadius: 15, inputType: .email)
                    TxtField(text: $password, placeholder: "Enter password", cornerRadius: 15, isSecure: true)
                }
                
                VStack {
                    Button(action: {
                        // action
                    }) {
                        NavLink(text: "Login", cornerRadius: 15)
                    }
                    .disabled(isButtonDisabled())
                    .opacity(isButtonDisabled() ? 0.5 : 1)
                    
                }
            }
            .padding(EdgeInsets(top: 24, leading: 16, bottom: 16, trailing: 16))
        }
        .scrollIndicators(.hidden)
        .navigationTitle("Login to your account")
    }
}

#Preview {
    LoginView()
}
