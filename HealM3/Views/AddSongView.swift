//
//  AddSongView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 20/06/24.
//

import SwiftUI

struct AddSongView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var songName: String = ""
    @State private var songSinger: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    
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
                            
                        })
                        {
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
            }){
                Text("Cancel")
                    .foregroundStyle(.orange1)
            }, trailing: Button(action: {
                //
            }){
                Text("Done")
                    .foregroundStyle(.orange1)
                    .fontWeight(.bold)
            })
            .background(.black)
        }
    }
}

#Preview {
    AddSongView()
}
