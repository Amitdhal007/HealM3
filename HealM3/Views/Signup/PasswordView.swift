//
//  PasswordView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 17/06/24.
//

import SwiftUI

struct PasswordView: View {
    @StateObject private var viewModel = SignInEmailViewModel.shared

    func isButtonDisabled() -> Bool {
        return viewModel.password.isEmpty || viewModel.confirmPassword.isEmpty || viewModel.password.count < 8 || viewModel.confirmPassword.count < 8 || viewModel.password != viewModel.confirmPassword
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 24) {
                    Spacer()

                    Image(systemName: "music.note.list")
                        .font(.system(size: 160))
                        .foregroundColor(.orange1)

                    Spacer()

                    VStack(spacing: 12) {
                        TxtField(text: $viewModel.password, placeholder: "Enter password", cornerRadius: 15, isSecure: true)
                        TxtField(text: $viewModel.confirmPassword, placeholder: "Confirm password", cornerRadius: 15, isSecure: true)
                    }

                    VStack {
                        Button(action: {
                            viewModel.signUp { result in
                                switch result {
                                case .success(let userData):
                                    print("Sign-up successful: \(userData)")
                                case .failure(let error):
                                    print("Sign-up error: \(error)")
                                }
                            }
                        }) {
                            NavLink(text: "Sign Up", cornerRadius: 15)
                        }
                        .disabled(isButtonDisabled())
                        .opacity(isButtonDisabled() ? 0.5 : 1)
                    }
                }
                .padding(EdgeInsets(top: 24, leading: 16, bottom: 16, trailing: 16))
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Set Password")
            .onDisappear {
                // Reset password fields when navigating away from this view
                viewModel.password = ""
                viewModel.confirmPassword = ""
            }
        }
    }
}

