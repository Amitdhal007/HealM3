//
//  SignupView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 17/06/24.
//

import SwiftUI

struct SignupView: View {
    
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var mobileNum: String = ""
    
    func isButtonDisabled() -> Bool {
        return (email.isEmpty || !email.contains("gmail.com")) || name.isEmpty || mobileNum.count < 10
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 24) {
                Spacer()
                
                Image(systemName: "music.note.list")
                    .font(.system(size: 160))
                    .foregroundColor(.orange1)
                
                Spacer()
                
                VStack {
                    TxtField(text: $email, placeholder: "Enter your email", cornerRadius: 15, inputType: .email)
                    TxtField(text: $name, placeholder: "Enter your name", cornerRadius: 15, inputType: .name)
                    TxtField(text: $mobileNum, placeholder: "Enter mobile no.", cornerRadius: 15, inputType: .mobNo)
                }
                
                VStack {
                    Button(action: {
                        // action
                    }) {
                        NavLink(text: "Proceed", cornerRadius: 15)
                    }
                    .disabled(isButtonDisabled())
                    .opacity(isButtonDisabled() ? 0.5 : 1)
                    
                }
            }
            .padding(EdgeInsets(top: 24, leading: 16, bottom: 16, trailing: 16))
        }
        .navigationTitle("Create your account")
    }
}

#Preview {
    SignupView()
}
