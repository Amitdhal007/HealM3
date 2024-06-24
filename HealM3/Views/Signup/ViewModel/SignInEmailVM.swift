//
//  ViewModel.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 22/06/24.
//

import Foundation

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    static let shared = SignInEmailViewModel()
    private init() {}
    
    @Published var email: String = ""
    @Published var name: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var mobileNo: String = ""
    @Published var appState = AppState()
    
    // Asynchronous sign-up method returning AuthDataResponseModel wrapped in Result
    func signUp(completion: @escaping (Result<AuthDataResponseModel, Error>) -> Void) {
        guard validateInputs(isSignUp: true) else {
            return completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid input"])))
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password, confirmedPassword: confirmPassword, name: name, mobileNum: mobileNo)
                print("Success")
                completion(.success(returnedUserData))
            } catch {
                print("Error: \(error)")
                completion(.failure(error))
            }
        }
    }
    
    // Asynchronous login method returning AuthDataResponseModel wrapped in Result
    func login(completion: @escaping (Result<AuthDataResponseModel, Error>) -> Void) {
        guard validateInputs(isSignUp: false) else {
            return completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid input"])))
        }
        
        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.signIn(email: email, password: password)
                print("Login Success")
                completion(.success(returnedUserData))
            } catch {
                print("Login Error: \(error)")
                completion(.failure(error))
            }
        }
    }
    
    private func validateInputs(isSignUp: Bool) -> Bool {
        guard !email.isEmpty else {
            print("Email should not be empty")
            return false
        }
        
        guard email.contains("@gmail.com") else {
            print("Email should be a Gmail address")
            return false
        }
        
        guard !password.isEmpty else {
            print("Password should not be empty")
            return false
        }
        
        if isSignUp {
            guard password.count >= 8 else {
                print("Password should be at least 8 characters long")
                return false
            }
            
            guard password == confirmPassword else {
                print("Password and confirm password should match")
                return false
            }
            
            guard !name.isEmpty else {
                print("Name should not be empty")
                return false
            }
            
            guard !mobileNo.isEmpty else {
                print("Mobile number should not be empty")
                return false
            }
            
            guard mobileNo.count == 10 else {
                print("Mobile number should be exactly 10 digits long")
                return false
            }
        }
        
        return true
    }
}
