//
//  HomeView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 18/06/24.
//

import SwiftUI

struct HomeView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @State var isAddPlaylistPresented: Bool = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Playlists")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                    
                    
                    LazyVGrid(columns: columns, spacing: 13) {
                        ForEach(0..<4) { _ in
                            NavigationLink(destination: AlbumSongView()){
                                AlbumCard()
                            }
                        }
                    }
                    
                }
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $searchText, prompt: "Search Playlist")
            .navigationBarItems(trailing: Button(action:{
                isAddPlaylistPresented = true
            }){
                Image(systemName: "plus")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Orange2"))
            })
            .sheet(isPresented: $isAddPlaylistPresented) {
                AddPlaylistView()
            }
        }
    }
}

#Preview {
    HomeView()
}
