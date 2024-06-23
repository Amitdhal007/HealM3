//
//  RootView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 22/06/24.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationView {
            if appState.isAuthenticated {
                TabBarView()
            } else {
                InitialLoginView()
                    .navigationBarHidden(true)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            appState.isAuthenticated = authUser != nil
        }
    }
}

#Preview {
    RootView()
        .environmentObject(AppState())
}
