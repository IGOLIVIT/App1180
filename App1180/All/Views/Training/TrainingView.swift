//
//  TrainingView.swift
//  App1180
//
//  Created by IGOR on 06/12/2024.
//

import SwiftUI

struct TrainingView: View {
    
    @StateObject var viewModel = TrainingViewModel()
    
    var body: some View {

        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Training")
                        .foregroundColor(.black)
                        .font(.system(size: 20, weight: .semibold))
                    
                    HStack {
                        
                        Spacer()
                        
                        Button(action: {
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isMatch = true
                            }
                            
                        }, label: {
                            
                            Image(systemName: "trophy.fill")
                                .foregroundColor(.black)
                        })
                    }
                }
                .padding(.bottom, 30)
             
                HStack {
                    
                    ForEach(viewModel.days, id: \.self) { index in
                    
                        Button(action: {
                            
                            viewModel.curDay = index
                            
                        }, label: {
                            
                            Text(index)
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .medium))
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.white).opacity(viewModel.curDay == index ? 1 : 0))
                        })
                    }
                }
                .padding(2)
                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                .padding(.bottom, 9)

                if viewModel.trainings.isEmpty {
                    
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
                    
                    if viewModel.trainings.filter({($0.trDay ?? "") == viewModel.curDay}).isEmpty {
                        
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
                                
                                ForEach(viewModel.trainings.filter{($0.trDay ?? "") == viewModel.curDay}, id: \.self) { index in
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        
                                        Text("Type")
                                            .foregroundColor(.black)
                                            .font(.system(size: 18, weight: .medium))
                                        
                                        HStack {
                                            
                                            Image(systemName: "clock")
                                                .foregroundColor(.white)
                                                .font(.system(size: 8, weight: .regular))
                                                .padding(3)
                                                .background(Circle().fill(.black))
                                            
                                            Text("\(Text("\((index.trSTime ?? Date()).convertDate(format: "hh:MM"))")) - \(Text("\((index.trFTime ?? Date()).convertDate(format: "hh:MM"))"))")
                                                .foregroundColor(.black)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                        
                                        HStack {
                                            
                                            Image(systemName: "calendar")
                                                .foregroundColor(.white)
                                                .font(.system(size: 8, weight: .regular))
                                                .padding(3)
                                                .background(Circle().fill(.black))
                                            
                                            Text(index.trDay ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                        
                                        Text("Description")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 13, weight: .regular))
                                        
                                        HStack {
                                            
                                            Image(systemName: "person.fill")
                                                .foregroundColor(.white)
                                                .font(.system(size: 8, weight: .regular))
                                                .padding(3)
                                                .background(Circle().fill(.black))
                                            
                                            Text(index.trPeople ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 13, weight: .regular))
                                        }
                                    }
                                    .padding(28)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .frame(height: 160)
                                    .background(Image(index.trPic ?? "").resizable())
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top)
            .onAppear {
                
                viewModel.fetchTrainings()
            }
            .sheet(isPresented: $viewModel.isAdd, content: {
                
                AddTraining(viewModel: viewModel)
            })
            .sheet(isPresented: $viewModel.isMatch, content: {
                
                MatchView()
            })
        }
    }
}

#Preview {
    TrainingView()
}
