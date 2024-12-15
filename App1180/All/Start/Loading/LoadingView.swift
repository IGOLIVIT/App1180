//
//  LoadingView.swift
//  App1180
//
//  Created by IGOR on 06/12/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            LinearGradient(colors: [Color("prim"), Color("prim2")], startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            
            VStack {
                
                Image("Llogo")
                    .resizable()
                
            }
            .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}
