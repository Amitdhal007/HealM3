//
//  HealM3App.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 17/06/24.
//

import SwiftUI
import Firebase

@main
struct HealM3App: App {
    
    var body: some Scene {
        WindowGroup {
            InitialLoginView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
