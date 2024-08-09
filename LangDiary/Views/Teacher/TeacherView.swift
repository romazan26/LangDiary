//
//  TeacherView.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import SwiftUI

struct TeacherView: View {
    @StateObject var vm: MainViewModel
    var body: some View {
        ZStack {
            //MARK: - backgorund
            Color.main.ignoresSafeArea()
            //MARK: - main stack
            VStack {
                //MARK: - Top tool bar
                HStack {
                    Button(action: {
                        vm.isPresentedAllTeacher.toggle()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 8, height: 15)
                        
                    }).frame(width: 38, height: 38)
                    
                    Spacer()
                    
                    Text("Teachers")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .heavy))
                        .offset(x: -16)
                    
                    Spacer()
                }
                
                //MARK: - Teacher list
                ScrollView {
                    ForEach(vm.teachers) { teacher in
                        HStack(alignment: .top){
                            Spacer()
                            TeacherCell(teacher: teacher,
                                        width: 142,
                                        height: 179,
                                        textsize: 20)
                            Spacer()
                            
                            //MARK: - Edite button
                            Button(action: {
                                vm.isPresentEdiiteteacher.toggle()
                                vm.simpleTeacher = teacher
                            }, label: {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .frame(width: 17, height: 17)
                                    .foregroundStyle(.gray)
                            })
                            .padding(.top)
                        }
                        
                    }
                }
                Spacer()
            }.padding()
        }.sheet(isPresented: $vm.isPresentEdiiteteacher, content: {
            AddTeacherView(vm: vm, isEdite: true)
        })
    }
}

#Preview {
    TeacherView(vm: MainViewModel())
}
