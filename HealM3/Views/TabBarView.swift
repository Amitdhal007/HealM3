//
//  TabBarView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 18/06/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            WishlistView()
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Wishlist")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    TabBarView()
}
