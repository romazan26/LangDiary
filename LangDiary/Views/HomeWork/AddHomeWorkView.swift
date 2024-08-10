//
//  AddHomeWorkView.swift
//  LangDiary
//
//  Created by Роман on 11.08.2024.
//

import SwiftUI

struct AddHomeWorkView: View {
    @StateObject var vm: MainViewModel
    @FocusState private var keyboardIsFocus: Bool
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            //MARK: - Main stack
            VStack {
                //MARK: - Toolbar
                HStack {
                    Button {
                        vm.isPresentAddHomeWork.toggle()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 15, height: 20)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    Text("New homework")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                        .offset(x: -6)
                    Spacer()
                    
                }
                
                //MARK: - Text field goup
                CustomTextFieldView(placeholder: "Exercise", text: $vm.simpleHomeWorkExercise)
                    .padding(.top)
                    .focused($keyboardIsFocus)
                CustomTextFieldView(placeholder: "Tasks", text: $vm.simpleHomeWorkTask)
                    .focused($keyboardIsFocus)
                
                ZStack {
                    Color.second
                    HStack{
                        DatePicker("Data", selection: $vm.simpleHomeWorkDate, displayedComponents: .date).colorScheme(.dark)
                            
                       Spacer()
                    }.padding()
                }
                .cornerRadius(19)
                .frame(maxWidth: .infinity)
                .frame(height: 64)
                
                Spacer()
                
                Button(action: {
                    vm.addHomeWork()
                    vm.isPresentAddHomeWork.toggle()
                }, label: {
                    CustomButtonView(text: "Add")
                })
            }.padding()
        }
        .onTapGesture {
            keyboardIsFocus = false
        }
    }
}

#Preview {
    AddHomeWorkView(vm: MainViewModel())
}
