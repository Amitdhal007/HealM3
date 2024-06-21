//
//  ViewModel.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 22/06/24.
//

import Foundation

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var mobileNo: String = ""
    
}
