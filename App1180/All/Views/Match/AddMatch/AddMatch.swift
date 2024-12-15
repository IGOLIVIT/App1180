//
//  AddMatch.swift
//  App1180
//
//  Created by IGOR on 10/12/2024.
//

import SwiftUI

struct AddMatch: View {
    
    @StateObject var viewModel: MatchViewModel
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
                            
                            viewModel.mTeam1 = ""
                            viewModel.mTeam2 = ""
                            viewModel.mPlace = ""
                            viewModel.curPic1 = ""
                            viewModel.curPic2 = ""
                            
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
                            
                            viewModel.mRes = viewModel.curResult
                            viewModel.mPic1 = viewModel.curPic1
                            viewModel.mPic2 = viewModel.curPic2
                            
                            viewModel.addMatch()
                            
                            viewModel.mTeam1 = ""
                            viewModel.mTeam2 = ""
                            viewModel.mPlace = ""
                            viewModel.curPic1 = ""
                            viewModel.curPic2 = ""
                            
                            viewModel.fetchMatches()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                        })
                        .opacity(viewModel.curResult.isEmpty || viewModel.mTeam1.isEmpty || viewModel.mTeam2.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.curResult.isEmpty || viewModel.mTeam1.isEmpty || viewModel.mTeam2.isEmpty ? true : false)
                    }
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        HStack {
                            
                            Menu(content: {
                                
                                ForEach(viewModel.picks, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.curPic1 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.curPic1.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 28, weight: .regular))
                                        .frame(width: 120, height: 120)
                                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.curPic1)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(width: 120, height: 120)
                                }
                                
                            })
                            
                            Spacer()
                            
                            Text("VS")
                                .foregroundColor(.gray)
                                .font(.system(size: 24, weight: .bold))
                            
                            Spacer()
                            
                            Menu(content: {
                                
                                ForEach(viewModel.picks, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.curPic2 = index
                                        
                                    }, label: {
                                        
                                        Image(index)
                                    })
                                }
                                
                            }, label: {
                                
                                if viewModel.curPic2.isEmpty {
                                    
                                    Image(systemName: "photo")
                                        .foregroundColor(Color("prim"))
                                        .font(.system(size: 28, weight: .regular))
                                        .frame(width: 120, height: 120)
                                        .background(RoundedRectangle(cornerRadius: 25.0).stroke(Color("prim")))
                                        .padding(1)
                                    
                                } else {
                                    
                                    Image(viewModel.curPic2)
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                    
                                }
                                
                            })
                        }
                        
                        HStack {
                            
                            Text("Time")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            Spacer()

                            DatePicker("", selection: $viewModel.mTime, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                        }
                        .padding(9)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)
                        
                        HStack {
                            
                            Text("Date")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.mDate, displayedComponents: .date)
                                .labelsHidden()

                        }
                        .padding(9)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)
                        
                        HStack {
                            
                            Text("Team 1")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.mTeam1.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.mTeam1)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)
                        
                        HStack {
                            
                            Text("Team 2")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.mTeam2.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.mTeam2)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)
                        
                        HStack {
                            
                            Text("Place")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.mPlace.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.mPlace)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)
                        
                        HStack {
                            
                            ForEach(viewModel.results, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.curResult = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.white).opacity(viewModel.curResult == index ? 1 : 0))
                                })
                            }
                        }
                        .padding(2)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddMatch(viewModel: MatchViewModel())
}
