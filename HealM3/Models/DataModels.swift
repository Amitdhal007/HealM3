//
//  DataModels.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 24/06/24.
//

import Foundation


struct userProfile {
    let userName: String
    let userEmail: String
    let userMobNum: String
}

struct Playlist: Identifiable {
    var id: String
    var name: String
}

struct Song: Identifiable {
    var id: String
    var name: String
    var singer: String
    var url: String
}
