//
//  AddTeam.swift
//  App1180
//
//  Created by IGOR on 10/12/2024.
//

import SwiftUI

struct AddTeam: View {
    
    @StateObject var viewModel: TeamViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Team")
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
                                
                                Text("Cancel")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                        
                        Button(action: {
                            
                            viewModel.teamPhoto = viewModel.curPic
                            viewModel.teamName = viewModel.tName
                            viewModel.teamPlay = viewModel.tPlay
                            viewModel.teamVic = viewModel.tVic
                            viewModel.teamEx = viewModel.tEx
                            
                            viewModel.tEx = ""
                            viewModel.tVic = ""
                            viewModel.tPlay = ""
                            viewModel.tName = ""
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                        })
                    }
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        Menu(content: {
                            
                            ForEach(viewModel.picks, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.curPic = index
                                    
                                }, label: {
                                    
                                    Image(index)
                                })
                            }
                            
                        }, label: {
                            
                            if viewModel.curPic.isEmpty {
                                
                                Image(systemName: "photo")
                                    .foregroundColor(Color("prim"))
                                    .font(.system(size: 28, weight: .regular))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 280)
                                    .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                                    .padding(1)
                                
                            } else {
                                
                                Image(viewModel.curPic)
                                    .resizable()
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 280)
                            }
                            
                        })
                        
                        Text("Team photo")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                        HStack {
                            
                            Text("Team")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.tName.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.tName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)
                        
                        HStack {
                            
                            Text("Players")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.tPlay.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.tPlay)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)
                        
                        HStack {
                            
                            Text("Vicroties")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.tVic.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.tVic)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)
                        
                        HStack {
                            
                            Text("Existense")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.tEx.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.tEx)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)
                        
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddTeam(viewModel: TeamViewModel())
}
