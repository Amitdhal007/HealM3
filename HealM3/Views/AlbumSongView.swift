//
//  AlbumSongView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 20/06/24.
//

import SwiftUI

struct AlbumSongView: View {
    
    var playlist: Playlist
    @State private var searchText: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var isSongAddedPresent: Bool = false
    @State private var isSongDetailPresent: Bool = false
    
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
                            .onTapGesture {
                                isSongDetailPresent = true
                            }
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
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
            .sheet(isPresented: $isSongAddedPresent, content: {
                AddSongView()
            })
            .sheet(isPresented: $isSongDetailPresent, content: {
                EachSongView()
            })
            .scrollIndicators(.hidden)
        }
    }
}

