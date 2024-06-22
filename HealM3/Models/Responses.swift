//
//  Responses.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 22/06/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResponseModel {
    let uid: String
    let email: String?
    let name: String?
    let mobileNum: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.name = user.displayName
        self.mobileNum = user.phoneNumber
    }
}
