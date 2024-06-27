//
//  AddSongView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 20/06/24.
//

import SwiftUI
import Firebase

struct AddSongView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var songName: String = ""
    @State private var songSinger: String = ""
    @State private var songData: Data?
    @State private var showingDocumentPicker = false
    var onAddSong: (String, String, String) -> Void
    
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
                        TxtField(text: $songName, placeholder: "Enter song name", cornerRadius: 15, inputType: .email)
                        TxtField(text: $songSinger, placeholder: "Enter song Singer", cornerRadius: 15, inputType: .email)
                    }
                    
                    VStack(spacing: 14) {
                        Button(action: {
                            showingDocumentPicker = true
                        }) {
                            Image(systemName: "arrow.up.doc")
                                .font(.system(size: 60))
                                .foregroundColor(.orange1)
                        }
                        
                        Text("Upload Song")
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                            .foregroundStyle(.gray)
                            .padding(.bottom, 10)
                    }
                    .padding(.top, 40)
                }
                .padding(EdgeInsets(top: 5, leading: 16, bottom: 16, trailing: 16))
            }
            .navigationTitle("Add Song")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
                    .foregroundStyle(.orange1)
            }, trailing: Button(action: {
                uploadSong()
            }) {
                Text("Done")
                    .foregroundStyle(.orange1)
                    .fontWeight(.bold)
            })
            .background(.black)
            .sheet(isPresented: $showingDocumentPicker) {
                DocumentPickerWrapper { urls in
                    guard let url = urls.first else { return }
                    do {
                        self.songData = try Data(contentsOf: url)
                    } catch {
                        print("Failed to load song data: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
    
    private func uploadSong() {
        guard let userId = Auth.auth().currentUser?.uid, let songData = songData else { return }
        FirebaseManager.shared.uploadSong(userId: userId, songData: songData) { result in
            switch result {
            case .success(let songURL):
                onAddSong(songName, songSinger, songURL)
                presentationMode.wrappedValue.dismiss()
            case .failure(let error):
                print("Failed to upload song: \(error.localizedDescription)")
            }
        }
    }
}


