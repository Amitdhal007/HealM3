//
//  TxtField.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 17/06/24.
//

import SwiftUI
import Foundation

struct TxtField: View {
    @Binding var text: String
    var showError: Bool = false
    var placeholder: String
    var cornerRadius: CGFloat
    var onEditingChanged: (Bool) -> Void = {_ in}
    var onCommit: () -> Void = {}
    var isSecure: Bool = false
    var inputType: InputTypes = .name
    var disabled: Bool = false
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if !isSecure {
                TextField(placeholder, text: $text, onEditingChanged: onEditingChanged, onCommit: onCommit)
                    .keyboardType(keyboardType(inputType))
                    .disabled(disabled)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .padding()
                    .frame(height: 50)
                    .background(Color(.systemGray6))
                    //.overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(Color("border")))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            } else {
                SecureField(placeholder, text: $text, onCommit: onCommit)
                    .padding()
                    .disabled(disabled)
                    .frame(height: 50)
                    //.overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(Color("border")))
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            }
            
            if showError {
                HStack{
                    Spacer()
                    Image(systemName: "xmark.circle")
                        .foregroundColor(.red)
                }
                .padding(.trailing, 8)
                .frame(maxWidth: .infinity)
            }
        }
    }
    
    private func keyboardType(_ inputType: InputTypes) -> UIKeyboardType {
        switch inputType {
        case .email:
            return .emailAddress
        case .password, .name:
            return .default
        case .mobNo:
            return .decimalPad
        }
    }
}

