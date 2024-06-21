//
//  ProfileView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 18/06/24.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 12) {
//                    Image("profile-1")
//                        .resizable()
//                        .frame(width: 100, height: 100)
//                        .padding(.top, 20)
                    
                    Text("AK")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(width: 100, height: 100)
                        .background(OrangeGradient)
                        .cornerRadius(50)
                    
                    Text("hey.amit0162")
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
                        DetaliLabel(text: "hey@amitkum")
                        DetaliLabel(text: "hey.amit0162@gmail.com")
                        DetaliLabel(text: "7986305141")
                    }
                    
                    Button(action: {
                        
                    })
                    {
                        NavLink(text: "Sign Out", cornerRadius: 15)
                    }
                    .padding(.top, 20)
                }
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
