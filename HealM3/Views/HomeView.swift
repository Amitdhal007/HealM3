//
//  HomeView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 18/06/24.
//

import SwiftUI
import Firebase

struct HomeView: View {
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    @State var isAddPlaylistPresented: Bool = false
    @State private var searchText = ""
    @State private var playlists: [Playlist] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Playlists")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                    
                    LazyVGrid(columns: columns, spacing: 13) {
                        ForEach(playlists) { playlist in
                            NavigationLink(destination: AlbumSongView(playlist: playlist)){
                                AlbumCard(name: playlist.name)
                            }
                        }
                    }
                    
                }
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .onAppear {
                loadPlaylists()
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
                AddPlaylistView { name in
                    addPlaylist(playlistName: name)
                }
            }
        }
    }
    
    func loadPlaylists() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        FirebaseManager.shared.fetchPlaylist(userId: userId) { fetchedPlaylists in
            self.playlists = fetchedPlaylists
        }
    }
    
    func addPlaylist(playlistName: String) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        FirebaseManager.shared.writePlaylist(userId: userId, playlistName: playlistName)
        loadPlaylists()
    }
}


