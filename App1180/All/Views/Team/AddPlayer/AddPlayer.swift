//
//  AddPlayer.swift
//  App1180
//
//  Created by IGOR on 10/12/2024.
//

import SwiftUI

struct AddPlayer: View {

    @StateObject var viewModel: TeamViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Player")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.plName = ""
                            viewModel.plSName = ""
                            viewModel.plPos = ""
                            viewModel.plNum = ""
                            viewModel.plEx = ""
                            viewModel.curPic = ""
                            
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
                            
                            viewModel.plPic = viewModel.curPic
                            
                            viewModel.addPlayer()
                            
                            viewModel.plName = ""
                            viewModel.plSName = ""
                            viewModel.plPos = ""
                            viewModel.plNum = ""
                            viewModel.plEx = ""
                            viewModel.curPic = ""
                            
                            viewModel.fetchPlayers()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddPlayer = false
                            }
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                        })
                        .opacity(viewModel.plNum.isEmpty || viewModel.plSName.isEmpty || viewModel.plPos.isEmpty || viewModel.plNum.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.plNum.isEmpty || viewModel.plSName.isEmpty || viewModel.plPos.isEmpty || viewModel.plNum.isEmpty ? true : false)
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
                        
                        Text("Player photo")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))

                        HStack {
                            
                            Text("Name")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.plName.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.plName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)

                        HStack {
                            
                            Text("Surname")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.plSName.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.plSName)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)
                        
                        HStack {
                            
                            Text("Position")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.plPos.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.plPos)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)

                        HStack {
                            
                            Text("Number")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("0")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.plNum.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.plNum)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)
                        
                        HStack {
                            
                            Text("Experience")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.plEx.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.plEx)
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
    AddPlayer(viewModel: TeamViewModel())
}
