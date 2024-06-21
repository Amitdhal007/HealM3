//
//  AlbumSongView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 20/06/24.
//

import SwiftUI

struct AlbumSongView: View {
    
    @State private var searchText: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Playlist Songs")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                        .padding(.bottom, 10)
                    
                    ForEach (0..<7) { _ in
                        MusicCard()
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationTitle("Akshay's Playlist")
            .searchable(text: $searchText, prompt: "Search Song")
            .navigationBarItems(trailing: Button(action: {
                //
            }){
                Image(systemName: "plus")
                    .foregroundStyle(.orange1)
                    .fontWeight(.bold)
            })
        }
    }
}

#Preview {
    AlbumSongView()
}
