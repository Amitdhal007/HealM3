//
//  ProfileView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 18/06/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var viewModel: ProfileViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: ProfileViewModel(appState: AppState()))
    }
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 12) {
                    if viewModel.isLoading {
                        ProgressView("Loading.....")
                    }
                    else if let userProfile = viewModel.userProfile {
                        Text(userProfile.userName.prefix(2))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(width: 100, height: 100)
                            .background(OrangeGradient)
                            .cornerRadius(50)
                        
                        Text(userProfile.userName)
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        VStack {
                            Text("Personal Information")
                                .font(.system(size: 17))
                                .fontWeight(.bold)
                                .foregroundStyle(.gray)
                        }
                        .padding(.top, 30)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(spacing: 12) {
                            DetaliLabel(text: userProfile.userName)
                            DetaliLabel(text: userProfile.userEmail)
                            DetaliLabel(text: userProfile.userMobNum)
                        }
                        
                        Button(action: {
                            Task {
                                do {
                                    try viewModel.signOut()
                                } catch {
                                    print("Failed to sign out")
                                }
                            }
                        }) {
                            NavLink(text: "Sign Out", cornerRadius: 15)
                        }
                        .padding(.top, 20)
                    } else if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
                .onAppear {
                    viewModel.fetchUserProfile()
                }
            }
            .navigationTitle("Profile")
        }
    }
}

