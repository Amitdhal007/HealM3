//
//  EachSongCard.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 21/06/24.
//

import SwiftUI

struct EachSongCard: View {
    
    @State private var songProgress: Double = 0.5
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                Image(systemName: "music.note.list")
                    .font(.system(size: 160))
                    .foregroundColor(.white)
            }
            .padding(20)
            .background(.orange1)
            .cornerRadius(15)
            
            Spacer()
            
            HStack {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Tum Hi Ho")
                        Text("Song. Arijit Singh")
                            .foregroundStyle(.gray)
                    }
                }
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(.orange1)
            }
            .padding(.bottom, 20)
            
            Slider(value: $songProgress,  in: 0...1)
                .padding(.bottom, 80)
                .accentColor(.orange1)
            
            HStack (spacing: 34){
                Button(action: {
                    
                }){
                    Image(systemName: "backward.fill")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                }
                Button(action: {
                    
                }){
                    Image(systemName: "play.fill")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                }
                Button(action: {
                    
                }){
                    Image(systemName: "forward.fill")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
        }
        .padding(EdgeInsets(top: 5, leading: 32, bottom: 16, trailing: 32))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    EachSongCard()
}
