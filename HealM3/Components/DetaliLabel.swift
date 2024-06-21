//
//  DetaliLabel.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 21/06/24.
//

import SwiftUI

struct DetaliLabel: View {
    
    var text: String
    var body: some View {
        VStack {
            Text(text)
                .padding(.leading, 20)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 66)
        .background(Color(.systemGray6))
        .cornerRadius(15)
    }
}

#Preview {
    DetaliLabel(text: "Amit Kumar")
}
