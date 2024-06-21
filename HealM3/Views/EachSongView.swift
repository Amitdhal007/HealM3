//
//  EachSongCard.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 21/06/24.
//

import SwiftUI

struct EachSongView: View {
    var body: some View {
        NavigationView {
            VStack {
                EachSongCard()
            }
            .background(.black)
        }
    }
}

#Preview {
    EachSongView()
}
