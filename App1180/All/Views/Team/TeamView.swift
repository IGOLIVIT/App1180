//
//  TeamView.swift
//  App1180
//
//  Created by IGOR on 06/12/2024.
//

import SwiftUI

struct TeamView: View {
    
    @StateObject var viewModel = TeamViewModel()
    
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
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddPlayer = true
                            }
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(Color("prim"))
                                .font(.system(size: 18, weight: .regular))
                        })
                        
                        Spacer()
                        
                    }
                }
                .padding(.bottom, 30)
                
                if viewModel.teamPhoto.isEmpty {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Team")
                                .foregroundColor(.gray)
                                .font(.system(size: 22, weight: .semibold))
                            
                            HStack {
                                
                                Image(systemName: "person.3.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 10, weight: .regular))
                                
                                if viewModel.teamPlay.isEmpty {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                } else {
                                    
                                    Text(viewModel.teamPlay)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                            }
                            
                            HStack {
                                
                                Image(systemName: "trophy.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 10, weight: .regular))
                                
                                if viewModel.teamVic.isEmpty {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                } else {
                                    
                                    Text(viewModel.teamVic)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                            }
                            
                            HStack {
                                
                                Image(systemName: "hockey.puck.fill")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 10, weight: .regular))
                                
                                if viewModel.teamEx.isEmpty {
                                    
                                    Text("0")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                } else {
                                    
                                    Text(viewModel.teamEx)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                }
                                
                                Spacer()
                                
                                Menu(content: {
                                    
                                    Button(action: {
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isAdd = true
                                        }
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Text("Edit")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Image(systemName: "square.and.pencil")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .regular))
                                        }
                                    })
                                    
                                }, label: {
                                    
                                    Text("...")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                })

                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 3))
                    .padding(3)
                    
                } else {
                    
                    HStack {
                        
                        Image(viewModel.teamPhoto)
                            .resizable()
                            .frame(width: 130, height: 130)
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            Text("Team")
                                .foregroundColor(.black)
                                .font(.system(size: 22, weight: .semibold))
                            
                            HStack {
                                
                                Image(systemName: "person.3.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 10, weight: .regular))
                                
                                Text(viewModel.teamPlay)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            HStack {
                                
                                Image(systemName: "trophy.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 10, weight: .regular))
                                
                                Text(viewModel.teamVic)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                            }
                            
                            HStack {
                                
                                Image(systemName: "hockey.puck.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 10, weight: .regular))
                                
                                Text(viewModel.teamEx)
                                    .foregroundColor(.black)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                                
                                Menu(content: {
                                    
                                    Button(action: {
                                        
                                        withAnimation(.spring()) {
                                            
                                            viewModel.isAdd = true
                                        }
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Text("Edit")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Image(systemName: "square.and.pencil")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .regular))
                                        }
                                    })
                                    
                                }, label: {
                                    
                                    Text("...")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .regular))
                                })
                            }
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 3))
                    .padding(3)
                }
                
                Text("Players")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .medium))
                    .padding(.vertical)
                
                if viewModel.players.isEmpty {
                    
                    VStack(spacing: 12) {
                        
                        Text("Empty")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .medium))
                        
                        Text("No entries")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAddPlayer = true
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
                            
                            ForEach(viewModel.players, id: \.self) { index in
                            
                                HStack {
                                    
                                    Image(index.plPic ?? "")
                                        .resizable()
                                        .frame(width: 130, height: 130)
                                    
                                    VStack(alignment: .leading, spacing: 7) {
                                        
                                        Text(index.plName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .semibold))
                                        
                                        Text(index.plSName ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .semibold))
                                        
                                        HStack {
                                            
                                            Image(systemName: "figure.australian.football")
                                                .foregroundColor(.black)
                                                .font(.system(size: 10, weight: .regular))
                                            
                                            Text(index.plPos ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        
                                        HStack {
                                            
                                            Image(systemName: "tshirt.fill")
                                                .foregroundColor(.black)
                                                .font(.system(size: 10, weight: .regular))
                                            
                                            Text(index.plNum ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                        }
                                        
                                        HStack {
                                            
                                            Image(systemName: "hockey.puck.fill")
                                                .foregroundColor(.black)
                                                .font(.system(size: 10, weight: .regular))
                                            
                                            Text("\(index.plEx ?? "") year")
                                                .foregroundColor(.black)
                                                .font(.system(size: 14, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Menu(content: {
                                                
                                                Button(action: {
                                                    
                                                    viewModel.selectedPlayer = index
                                                    
                                                    withAnimation(.spring()) {
                                                        
                                                        viewModel.isDelete = true
                                                    }
                                                    
                                                }, label: {
                                                    
                                                    HStack {
                                                        
                                                        Text("Delete")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 15, weight: .regular))
                                                        
                                                        Spacer()
                                                        
                                                        Image(systemName: "trash")
                                                            .foregroundColor(.black)
                                                            .font(.system(size: 15, weight: .regular))
                                                    }
                                                })
                                                
                                            }, label: {
                                                
                                                Text("...")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .regular))
                                            })
                                        }
                                    }
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 15).fill(.white).shadow(radius: 3))
                                .padding(3)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .onAppear {
                
                viewModel.fetchPlayers()
            }
            .sheet(isPresented: $viewModel.isAdd, content: {
                
                AddTeam(viewModel: viewModel)
            })
            .sheet(isPresented: $viewModel.isAddPlayer, content: {
                
                AddPlayer(viewModel: viewModel)
            })
        }
        .overlay(
            
            ZStack {
                
                Color.black.opacity(viewModel.isDelete ? 0.5 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        
                        withAnimation(.spring()) {
                            
                            viewModel.isDelete = false
                        }
                    }
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Image(systemName: "xmark")
                                .foregroundColor(.black)
                                .font(.system(size: 13, weight: .regular))
                        })
                    }
                    
                    Text("Delete")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                        .padding()
                    
                    Text("Are you sure you want to delete?")
                        .foregroundColor(.black.opacity(0.7))
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        
                        Button(action: {
                            
                            CoreDataStack.shared.deletePlayer(withPlSurname: viewModel.selectedPlayer?.plSName ?? "", completion: {
                                
                                viewModel.fetchPlayers()
                            })

                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                                viewModel.isDetail = false
                            }
                            
                        }, label: {
                            
                            Text("Delete")
                                .foregroundColor(.red)
                                .font(.system(size: 18, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isDelete = false
                            }
                            
                        }, label: {
                            
                            Text("Close")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .frame(maxWidth: .infinity)
                                .frame(height: 45)
                            
                        })
                    }
                    .padding(.top, 25)

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding()
                .offset(y: viewModel.isDelete ? 0 : UIScreen.main.bounds.height)
            }
        )
    }
}

#Preview {
    TeamView()
}
