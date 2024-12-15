//
//  MatchView.swift
//  App1180
//
//  Created by IGOR on 06/12/2024.
//

import SwiftUI

struct MatchView: View {

    @StateObject var viewModel = MatchViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Match")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .font(.system(size: 17, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {
                                                        
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .regular))
                        })
                        .opacity(viewModel.matches.isEmpty ? 0 : 1)
                    }
                }
                .padding(.bottom, 30)
                
                if viewModel.matches.isEmpty {
                    
                    VStack(spacing: 12) {
                        
                        Text("Empty")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("No entries")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = true
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .medium))
                                .padding(6)
                                .padding(.horizontal)
                                .background(RoundedRectangle(cornerRadius: 16).fill(Color("prim")))
                        })
                    }
                    .frame(maxHeight: .infinity)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.matches, id: \.self) { index in
                            
                                VStack(spacing: 12) {
                                    
                                    Text("Type match")
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .medium))
                                    
                                    HStack {
                                        
                                        VStack(spacing: 10) {
                                            
                                            Image(index.mPic1 ?? "")
                                                .resizable()
                                                .frame(width: 120, height: 120)
                                         
                                            Text(index.mTeam1 ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .medium))
                                        }
                                        
                                        Spacer()
                                        
                                        Text("VS")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 24, weight: .bold))
                                        
                                        Spacer()
                                        
                                        VStack(spacing: 10) {
                                            
                                            Image(index.mPic2 ?? "")
                                                .resizable()
                                                .frame(width: 120, height: 120)
                                            
                                            Text(index.mTeam2 ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 16, weight: .medium))
                                        }
                                    }
                                    
                                    HStack {
                                        
                                        Rectangle()
                                            .fill(Color("prim"))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 2)
                                        
                                        Text(index.mRes ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .medium))
                                            .padding(.horizontal)
                                        
                                        Rectangle()
                                            .fill(Color("prim"))
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 2)
                                    }
                                    
                                    HStack {
                                        
                                        Image(systemName: "clock")
                                            .foregroundColor(.white)
                                            .font(.system(size: 8, weight: .regular))
                                            .padding(3)
                                            .background(Circle().fill(.black))
                                        
                                        Text("\(Text("\((index.mTime ?? Date()).convertDate(format: "hh:MM"))"))")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        
                                        Image(systemName: "calendar")
                                            .foregroundColor(.white)
                                            .font(.system(size: 8, weight: .regular))
                                            .padding(3)
                                            .background(Circle().fill(.black))
                                        
                                        Text("\(Text("\((index.mDate ?? Date()).convertDate(format: "MMM dd, YYYY"))"))")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        
                                        Image(systemName: "location.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: 14, weight: .regular))
                                        
                                        Text(index.mPlace ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        Spacer()
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 25).fill(.white).shadow(color: .gray, radius: 3))
                                .padding(3)
                            }
                        }
                    }
                }
                
            }
            .padding(.horizontal)
            .padding(.top)
            .onAppear {
                
                viewModel.fetchMatches()
            }
            .sheet(isPresented: $viewModel.isAdd, content: {
                
                AddMatch(viewModel: viewModel)
            })
        }
    }
}

#Preview {
    MatchView()
}
