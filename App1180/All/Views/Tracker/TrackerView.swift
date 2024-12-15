//
//  TrackerView.swift
//  App1180
//
//  Created by IGOR on 06/12/2024.
//

import SwiftUI
import StoreKit

struct TrackerView: View {
    
    @StateObject var viewModel = TrackerViewModel()
    @StateObject var mainModel: MatchViewModel
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Tracker")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                    
                    HStack {
                        
                        Spacer()

                    }
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {

                        if mainModel.matches.isEmpty {
                            
                            VStack {
                                
                                Text("Skill level")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 26, weight: .bold))
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Speed")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(0)) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)
                                    
                                    
                                    Text("0%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)

                                }
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Flexibility")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .semibold))

                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(0)) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)

                                    Text("0%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)

                                }
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Strenght")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .semibold))

                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(0)) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)

                                    Text("0%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)

                                }
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Position")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .semibold))

                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(0)) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)

                                    Text("\((Int(0)))%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)

                                }
                                
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 25).fill(.white).shadow(color: .gray, radius: 4))
                            .padding(5)
                            
                            VStack {
                                
                                Text("Match Rating")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 26, weight: .bold))
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Win")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(0)) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)

                                    Text("\((Int(0)))%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)

                                }
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Defeat")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(0)) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)

                                    Text("\((Int(0)))%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)

                                }
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Draw")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(0)) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)

                                    Text("\((Int(0)))%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 25).fill(.white).shadow(color: .gray, radius: 4))
                            .padding(5)
                            
                        } else {
                            
                            VStack {
                                
                                Text("Skill level")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 26, weight: .bold))
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Speed")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(viewModel.speed) ?? 0) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)
                                    
                                    
                                    Text("\((Int(viewModel.speed) ?? 0))%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)

                                }
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Flexibility")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(viewModel.flex) ?? 0) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)

                                    Text("\((Int(viewModel.flex) ?? 0))%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)

                                }
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Strenght")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(viewModel.flex) ?? 0) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)

                                    Text("\((Int(viewModel.stren) ?? 0))%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)

                                }
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Position")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(viewModel.pos) ?? 0) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)

                                    Text("\((Int(viewModel.pos) ?? 0))%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)

                                }
                                
                            }
                            .padding(20)
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 25).fill(.white).shadow(color: .gray, radius: 4))
                            .padding(5)
                            
                            VStack {
                                
                                Text("Match Rating")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 26, weight: .bold))
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Win")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(viewModel.win) ?? 0) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)

                                    Text("\((Int(viewModel.win) ?? 0))%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)

                                }
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Defeat")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(viewModel.def) ?? 0) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)

                                    Text("\((Int(viewModel.def) ?? 0))%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)

                                }
                                
                                HStack(spacing: 20) {
                                    
                                    Text("Draw")
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .semibold))
                                    
                                    Spacer()
                                    
                                    GeometryReader { reader in
                                        
                                        let result = CGFloat((CGFloat(Int(viewModel.draw) ?? 0) * reader.size.width)) / CGFloat(100)
                                        
                                        ZStack(alignment: .leading, content: {
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.black)
                                                .frame(width: reader.size.width, height: 14)
                                            
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color("prim"))
                                                .frame(width: result, height: 14)
                                        })
                                    }
                                    .frame(width: 170, height: 10)

                                    Text("\((Int(viewModel.draw) ?? 0))%")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                                        .frame(width: 40)
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(RoundedRectangle(cornerRadius: 25).fill(.white).shadow(color: .gray, radius: 4))
                            .padding(5)
                        }
                        
                        Text("More")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .semibold))
                            .padding()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            HStack {
                                
                                Button(action: {
                                    
                                    SKStoreReviewController.requestReview()
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        Text("Rate App")
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .bold))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "location.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .bold))
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                        
                                    }
                                    .padding(20)
                                    .frame(width: 170, height: 170)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                                })
                                
                                Button(action: {
                                    
                                    guard let url = URL(string: "https://www.termsfeed.com/live/fddb0bf5-e295-4edc-9054-ebfefee8a6c4") else { return }
                                    
                                    UIApplication.shared.open(url)
                                    
                                }, label: {
                                    
                                    VStack {
                                        
                                        Text("Usage Policy")
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .bold))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "location.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .bold))
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                        
                                    }
                                    .padding(20)
                                    .frame(width: 170, height: 170)
                                    .background(RoundedRectangle(cornerRadius: 20).fill(Color("prim")))
                                })
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)
        }
        .onAppear {
            
            mainModel.fetchMatches()
        }
    }
}

#Preview {
    TrackerView(mainModel: MatchViewModel())
}
