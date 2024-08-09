//
//  MainView.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var vmRegistration: RegistrationViewModel
    @StateObject var vm = MainViewModel()
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            
            //MARK: - Main stack
            VStack {
                //MARK: User info and Settings button
                HStack {
                    if !vmRegistration.users.isEmpty{
                        HStack{
                            //MARK: - Image
                            if let imgData = vmRegistration.users.first!.photo{
                                    Image(uiImage: imgData)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 58, height: 58)
                                        .cornerRadius(28)
                            }else {
                                Image(.noFoto)
                                    .frame(width: 58, height: 58)
                                    .cornerRadius(28)
                            }
                            
                            //MARK: - Name serName language
                            VStack(alignment: .leading){
                                Text("Hi, \(vmRegistration.users.first?.name ?? "") \(vmRegistration.users.first?.serName ?? "")")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 18, weight: .heavy))
                               
                                    Text("\(vmRegistration.users.first?.language ?? "")")
                                        .padding(6)
                                        .foregroundStyle(.white)
                                        .font(.system(size: 16, weight: .heavy))
                                        .background(Color.orangeApp)
                                .frame(height: 22)
                                .cornerRadius(86)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .foregroundColor(.gray)
                    }).frame(width: 21, height: 21)
                }
                .padding()
                .background {
                    Color.second
                        .frame(width: 393,height: 145)
                            .cornerRadius(29)
                            .offset(y: -25)
                }
                
                
                //MARK: - Title and button SeeAll
                HStack{
                    Text("Teachers")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .heavy))
                     Spacer()
                    Button(action: {}, label: {
                        Text("See all").foregroundStyle(.gray)
                    })
                }.padding(.top)
                
                //MARK: - Teacher List
                HStack {
                    ForEach(vm.teachers.prefix(3)) { teacher in
                        TeacherCell(teacher: teacher, width: 73, height: 100).padding(5)
                    }
                    Button(action: {vm.isPresentAddteacher.toggle()}, label: {
                        Image(.addteacher)
                            .resizable()
                            .frame(width: 73, height: 73)
                    })
                    Spacer()
                }
                
                //MARK: - Words list
                HStack{
                    HStack{
                        Text("New word \(vm.words.count)")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .heavy))
                         Spacer()
                        if vm.isAddWord{
                            Button(action: {
                                vm.isAddWord.toggle()
                                vm.addAllWords()
                            }, label: {
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .frame(width: 34, height: 34)
                                    .foregroundStyle(.orangeApp)
                            })
                        }else{
                            Button(action: {vm.isAddWord.toggle()}, label: {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 34, height: 34)
                                    .foregroundStyle(.orangeApp)
                            })
                        }
                    }.padding(.top)
                }
                if vm.isAddWord{
                    HStack(spacing: 20){
                        WordTextFieldView(text: $vm.simpleWord1)
                        WordTextFieldView(text: $vm.simpleWord2)
                    }
                }
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()], content: {
                        ForEach(vm.words) { word in
                            WordCellView(word: word)
                        }
                    })
                }
                Spacer()
                //MARK: - Homework button
                HStack{
                    Button(action: {}, label: {
                        CircleButtonView(image: .grafics)
                    })
                    Spacer()
                    Button(action: {}, label: {
                        CircleButtonView(image: .homeworks)
                    })
                }
            }.padding()
        }
        .sheet(isPresented: $vm.isPresentAddteacher, content: {
            AddTeacherView(vm: vm)
        })
    }
}

#Preview {
    MainView(vmRegistration: RegistrationViewModel())
}
