//
//  SignupView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 17/06/24.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    
    func isButtonDisabled() -> Bool {
        return (viewModel.email.isEmpty || !viewModel.email.contains("gmail.com")) || viewModel.name.isEmpty || viewModel.mobileNo.count < 10
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
                    TxtField(text: $viewModel.email, placeholder: "Enter your email", cornerRadius: 15, inputType: .email)
                    TxtField(text: $viewModel.name, placeholder: "Enter your name", cornerRadius: 15, inputType: .name)
                    TxtField(text: $viewModel.mobileNo, placeholder: "Enter mobile no.", cornerRadius: 15, inputType: .mobNo)
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
