//
//  MusicCard.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 20/06/24.
//

import SwiftUI

struct MusicCard: View {
    
    var songName: String
    var songSinger: String
    
    var body: some View {
        HStack {
            Image(systemName: "music.note")
                .font(.system(size: 44))
                .foregroundColor(.orange1)
            
            VStack(alignment: .leading) {
                Text(songName)
                Text("Song. \(songSinger)")
                    .foregroundStyle(.gray)
            }
            .padding(.leading, 15)
            
            Spacer()
            
            Button(action: {
                //
            })
            {
                Image(systemName: "chevron.forward")
                    .font(.system(size: 20))
                    .foregroundColor(Color(.systemGray))
            }
        }
        .padding(10)
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
}

