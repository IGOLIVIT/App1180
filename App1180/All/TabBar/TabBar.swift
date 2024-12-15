//
//  TabBar.swift
//  App1180
//
//  Created by IGOR on 06/12/2024.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    if selectedTab == index {
                        
                        HStack {
                            
                            Image(index.rawValue)
                                .renderingMode(.template)
                                .foregroundColor(Color("prim"))
                                .frame(width: 15, height: 15)
                            
                            Text(index.rawValue)
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 12, weight: .medium))
                        }
                        .padding()
                        .padding(.horizontal, 8)
                        .background(RoundedRectangle(cornerRadius: 25).fill(.black))
                        .padding(1)

                    } else {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(Color.black)
                            .padding()
                            .background(Circle().stroke(.black))
                            .padding(1)
                        
                    }
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 14)
        .padding(.bottom, 28)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.2)))
        .ignoresSafeArea()
    }
}

enum Tab: String, CaseIterable {
    
    case Training = "Training"
    
    case Tracker = "Tracker"
            
    case Team = "Team"
    
}
