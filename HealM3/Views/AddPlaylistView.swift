//
//  AddPlaylistView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 18/06/24.
//

import SwiftUI

struct AddPlaylistView: View {
    
    @State private var playlistName: String = ""
    @Environment(\.presentationMode) var presentationMode
    var onAdd: (String) -> Void
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    Spacer()
                    
                    Image(systemName: "music.note.list")
                        .font(.system(size: 160))
                        .foregroundColor(.orange1)
                    
                    Spacer()
                    Spacer()
                    
                    VStack {
                        TxtField(text: $playlistName, placeholder: "Enter Playlist name", cornerRadius: 15, inputType: .email)
                    }
                }
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
                
            }
            .navigationTitle("Add Playlist")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }){
                Text("Cancel")
                    .foregroundStyle(.orange1)
            }, trailing: Button(action: {
                onAdd(playlistName)
                presentationMode.wrappedValue.dismiss()
            }){
                Text("Done")
                    .foregroundStyle(.orange1)
                    .fontWeight(.bold)
            })
            .background(.black)
        }
        
    }
}
