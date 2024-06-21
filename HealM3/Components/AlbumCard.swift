//
//  AlbumCard.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 18/06/24.
//

import SwiftUI

struct AlbumCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Image(systemName: "music.quarternote.3")
                .foregroundColor(.white)
                .font(.system(size: 44))
            
            Text("Akshay’s Playlist")
                .foregroundColor(.white)
                .font(.system(size: 17))
        }
        .frame(width: UIScreen.main.bounds.width / 2 - 24, height: 133)
        .background(OrangeGradient)
        .cornerRadius(15)
    }
}

#Preview {
    AlbumCard()
}
