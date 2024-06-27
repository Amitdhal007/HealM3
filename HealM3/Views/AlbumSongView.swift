//
//  AlbumSongView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 20/06/24.
//

import SwiftUI
import Firebase

struct AlbumSongView: View {
    
    var playlist: Playlist
    @State private var searchText: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var isSongAddedPresent: Bool = false
    @State private var isSongDetailPresent: Bool = false
    @State private var songs: [Song] = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Playlist Songs")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .foregroundStyle(.gray)
                        .padding(.bottom, 10)
                    
                    ForEach(songs) { song in
                        MusicCard(songName: song.name, songSinger: song.singer)
                            .onTapGesture {
                                isSongDetailPresent = true
                            }
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .onAppear {
                loadSongs()
            }
            .navigationTitle(playlist.name)
            .searchable(text: $searchText, prompt: "Search Song")
            .navigationBarItems(trailing: Button(action: {
                isSongAddedPresent = true
            }){
                Image(systemName: "plus")
                    .foregroundStyle(.orange1)
                    .fontWeight(.bold)
            })
            .sheet(isPresented: $isSongAddedPresent) {
                AddSongView { songName, songSinger, songURL in
                    addSongToPlaylist(songName: songName, songSinger: songSinger, songURL: songURL)
                }
            }
            .sheet(isPresented: $isSongDetailPresent) {
                EachSongView()
            }
            .scrollIndicators(.hidden)
        }
    }
    
    func loadSongs() {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        FirebaseManager.shared.fetchSongs(userId: userId, playlistId: playlist.id) { fetchedSongs, error in
            if let error = error {
                print("Failed to fetch songs: \(error.localizedDescription)")
                return
            }
            self.songs = fetchedSongs
        }
    }
    
    func addSongToPlaylist(songName: String, songSinger: String, songURL: String) {
        guard let userId = Auth.auth().currentUser?.uid else { return }
        FirebaseManager.shared.addSongToPlaylist(userId: userId, playlistId: playlist.id, songName: songName, songSinger: songSinger, songURL: songURL) { result in
            switch result {
            case .success:
                loadSongs()
            case .failure(let error):
                print("Failed to add song to playlist: \(error.localizedDescription)")
            }
        }
    }
}

