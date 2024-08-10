//
//  HomeWorkView.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import SwiftUI

struct HomeWorkView: View {
    
    @StateObject var vm: MainViewModel
    
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            //MARK: - Main stack
            VStack {
                //MARK: - Toolbar
                HStack {
                    Button {
                        vm.isPresentHomeWork.toggle()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 15, height: 20)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    Text("Homework")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                        .offset(x: 6)
                    Spacer()
                    
                }
                
                //MARK: - HomeWork list
                ScrollView {
                    ForEach(vm.homeWorks) { homeWork in
                        HomeWorkCell(homeWork: homeWork)
                    }
                }
                Spacer()
                
                //MARK: - Add button
                Button(action: {
                    vm.isPresentAddHomeWork.toggle()
                }, label: {
                    CustomButtonView(text: "Add new")
                })
            }.padding()
        }.sheet(isPresented: $vm.isPresentAddHomeWork, content: {
            AddHomeWorkView(vm: vm)
        })
    }
}

#Preview {
    HomeWorkView(vm: MainViewModel())
}
