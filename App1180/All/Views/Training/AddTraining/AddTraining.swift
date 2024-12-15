//
//  AddTraining.swift
//  App1180
//
//  Created by IGOR on 09/12/2024.
//

import SwiftUI

struct AddTraining: View {
    
    @StateObject var viewModel: TrainingViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color.white
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Training")
                        .foregroundColor(.black)
                        .font(.system(size: 18, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            viewModel.trType = ""
                            viewModel.trPeople = ""
                            viewModel.trDescr = ""
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
                            
                            viewModel.trDay = viewModel.dayForAdd
                            viewModel.trPic = viewModel.curPic
                            
                            viewModel.addTraining()
                            
                            viewModel.trType = ""
                            viewModel.trPeople = ""
                            viewModel.trDescr = ""
                            viewModel.curPic = ""
                            
                            viewModel.fetchTrainings()
                            
                            withAnimation(.spring()) {
                                
                                viewModel.isAdd = false
                            }
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.black)
                                .font(.system(size: 18, weight: .regular))
                        })
                        .opacity(viewModel.curPic.isEmpty || viewModel.trType.isEmpty || viewModel.trPeople.isEmpty || viewModel.trDescr.isEmpty ? 0.5 : 1)
                        .disabled(viewModel.curPic.isEmpty || viewModel.trType.isEmpty || viewModel.trPeople.isEmpty || viewModel.trDescr.isEmpty ? true : false)
                    }
                }
                .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 12) {
                        
                        TabView {
                            
                            ForEach(viewModel.picks, id: \.self) { index in

                                    Image(index)
                                        .resizable()
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 150)
                                        .onAppear {
                                            
                                            viewModel.curPic = index
                                        }
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                        .frame(height: 150)
                        .padding(.horizontal)

                        HStack {
                            
                            ForEach(viewModel.days, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.dayForAdd = index
                                    
                                }, label: {
                                    
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .medium))
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 50)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.white).opacity(viewModel.dayForAdd == index ? 1 : 0))
                                })
                            }
                        }
                        .padding(2)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                        
                        HStack {
                            
                            Text("Type")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.trType.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.trType)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)

                        HStack {
                            
                            Text("Time")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            Spacer()
                            
                            DatePicker("", selection: $viewModel.trSTime, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                            
                            Text("-")
                                .foregroundColor(.black)
                                .font(.system(size: 15, weight: .regular))
                                .padding(.horizontal)
                            
                            DatePicker("", selection: $viewModel.trFTime, displayedComponents: .hourAndMinute)
                                .labelsHidden()
                        }
                        .padding(9)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)
                        
                        HStack {
                            
                            Text("People")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.trPeople.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.trPeople)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                            })
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 3))
                        .padding(3)

                        HStack {
                            
                            Text("Description")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .regular))
                                .padding(.trailing)
                            
                            ZStack(content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .medium))
                                    .opacity(viewModel.trDescr.isEmpty ? 1 : 0)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("", text: $viewModel.trDescr)
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
    AddTraining(viewModel: TrainingViewModel())
}
