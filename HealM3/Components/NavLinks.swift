//
//  NavLinks.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 17/06/24.
//

import Foundation
import SwiftUI

struct NavLink: View {
    var text: String
    var cornerRadius: CGFloat
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 66)
            .background(OrangeGradient)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }
}
