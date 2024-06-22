//
//  NetworkManager.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 21/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private let firebaseManager = FirebaseManager.shared
    private init() {}
    
    func getAuthenticatedUser() throws -> AuthDataResponseModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResponseModel.init(user: user)
    }
    
    func createUser(email: String, password: String, confirmedPassword: String, name: String, mobileNum: String) async throws -> AuthDataResponseModel {
        let authDateResponse = try await Auth.auth().createUser(withEmail: email, password: password)
        let userId = authDateResponse.user.uid
        firebaseManager.writeUserData(userId: userId, name: name, email: email, mobileNum: mobileNum)
        
        return AuthDataResponseModel.init(user: authDateResponse.user)
    }
}


class FirebaseManager {
    static let shared = FirebaseManager()
    private let ref: DatabaseReference
    
    private init() {
        self.ref = Database.database().reference()
    }
    
    func writeUserData(userId: String, name: String, email: String, mobileNum: String) {
        let userData: [String: Any] = [
            "name": name,
            "email": email,
            "mobileNum": mobileNum
        ]
        
        ref.child("users").child(userId).setValue(userData)
    }
    
}
