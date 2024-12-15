//
//  ContentView.swift
//  App1180
//
//  Created by IGOR on 06/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var current_tab: Tab = Tab.Tracker

    @AppStorage("status") var status: Bool = false
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            Color.white.opacity(0.1)
                .ignoresSafeArea()
                        
            VStack(spacing: 0, content: {
            
                    TabView(selection: $current_tab, content: {
                        
                        TrackerView(mainModel: MatchViewModel())
                            .tag(Tab.Tracker)
                        
                        TrainingView()
                            .tag(Tab.Training)
                        
                        TeamView()
                            .tag(Tab.Team)
                        
                    })
                    
                })
                    .ignoresSafeArea(.all, edges: .bottom)
                    .onAppear {
                        
                    }
            
            VStack {
                
                Spacer()
                
                TabBar(selectedTab: $current_tab)

            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
