//
//  NetworkManager.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 21/06/24.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class AppState: ObservableObject {
    @Published var isAuthenticated: Bool = false
}



final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    private let firebaseManager = FirebaseManager.shared
    private var appState: AppState? = nil
    
    private init() {}
    
    func configure(appState: AppState) {
        self.appState = appState
    }
    
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
        
        // Update app state
        DispatchQueue.main.async {
            self.appState?.isAuthenticated = true
        }
        
        return AuthDataResponseModel.init(user: authDateResponse.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
        
        DispatchQueue.main.async {
            self.appState?.isAuthenticated = false
        }
    }
    
    func signIn(email: String, password: String) async throws -> AuthDataResponseModel {
        let authDataResponse = try await Auth.auth().signIn(withEmail: email, password: password)
        
        //update app state
        DispatchQueue.main.async {
            self.appState?.isAuthenticated = true
        }
        
        return AuthDataResponseModel(user: authDataResponse.user)
    }
    
    func fetchUserProfileData(completion: @escaping(Result<userProfile, Error>) -> Void) {
        guard let user = Auth.auth().currentUser else {
            return completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No Authenticate User found"])))
        }
        
        firebaseManager.fetchUserData(userID: user.uid, completion: completion)
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
    
    func fetchUserData(userID: String, completion: @escaping(Result<userProfile, Error>) -> Void ) {
        ref.child("users").child(userID).observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                return completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User data not found"])))
            }
            
            let name = value["name"] as? String ?? ""
            let email = value["email"] as? String ?? ""
            let mobileNum = value["mobileNum"] as? String ?? ""
            
            let userProfile = userProfile(userName: name, userEmail: email, userMobNum: mobileNum)
            completion(.success(userProfile))
        }
    withCancel: { error in
        completion(.failure(error))
    }
    }
    
    func fetchPlaylist(userId: String, completion: @escaping ([Playlist]) -> Void) {
        ref.child("users").child(userId).child("playlists").observeSingleEvent(of: .value) { snapshot in
            var playlists: [Playlist] = []
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String: Any],
                   let name = dict["name"] as? String {
                    let playlist = Playlist(id: childSnapshot.key, name: name)
                    playlists.append(playlist)
                }
            }
            completion(playlists)
        }
    }
    
    func writePlaylist(userId: String, playlistName: String) {
        let playlistData: [String: Any] = [
            "name": playlistName
        ]
        
        ref.child("users").child(userId).child("playlists").childByAutoId().setValue(playlistData)
    }
    
}



@MainActor
final class ProfileViewModel: ObservableObject {
    @Published var userProfile: userProfile?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let appState: AppState
    
    init(appState: AppState) {
        self.appState = appState
    }
    
    func fetchUserProfile() {
        isLoading = true
        AuthenticationManager.shared.fetchUserProfileData { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let userProfile):
                    self.userProfile = userProfile
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func signOut() throws {
        try AuthenticationManager.shared.signOut()
        appState.isAuthenticated = false
    }
}

