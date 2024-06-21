//
//  WishlistView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 18/06/24.
//

import SwiftUI

struct WishlistView: View {
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Favourite Playlists")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHGrid(rows: [GridItem(.fixed(150))], spacing: 16) {
                            ForEach(0..<4) { _ in
                                AlbumCard()
                            }
                        }
                    }
                    
                    Text("Favourite Songs")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                        .padding(.top, 10)
                    
                    
                    LazyVGrid(columns: columns, spacing: 13) {
                        ForEach(0..<4) { _ in
                            MusicCard()
                        }
                    }
                    .padding(.top, 10)
                }
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishlistView()
}
