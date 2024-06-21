//
//  InitialView.swift
//  HealM3
//
//  Created by Amit Kumar Dhal on 17/06/24.
//

import SwiftUI

struct InitialLoginView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 24) {
                    Spacer()
                    Image(systemName: "music.note.list")
                        .font(.system(size: 160))
                        .foregroundColor(.orange1)
                    
                    Spacer()
                    
                    VStack(alignment: .center){
                        Text("Welcome to HealM3")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("One stop solution for Music")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack(spacing: 16) {
                        NavigationLink(destination: LoginView()) {
                            NavLink(text: "Continue", cornerRadius: 15)
                        }
                        
                        HStack{
                            NavigationLink(destination: SignupView()){
                                Text("Sign up")
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color("Orange1"))
                            }
                        }
                    }
                    .padding(.top, 10)
                }
                .padding(EdgeInsets(top: 48, leading: 16, bottom: 16, trailing: 16))
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    InitialLoginView()
}
