//
//  AddTeacherView.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import SwiftUI
import PhotosUI

struct AddTeacherView: View {
    @StateObject var vm: MainViewModel
    
    var isEdite = false
    
    @FocusState private var keyboardIsFocus: Bool
    
    var config: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 1
        
        return config
    }
    
    var body: some View {
        ZStack {
            //MARK: - background
            Color.main.ignoresSafeArea()
            //MARK: - main stack
            VStack {
                
                //MARK: - Top tool bar
                HStack {
                    Button(action: {
                        if isEdite{
                            vm.isPresentEdiiteteacher.toggle()
                        }else{
                            vm.isPresentAddteacher.toggle()
                        }
                        vm.clearDataTeacher()
                    }, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 8, height: 15)
                        
                    }).frame(width: 38, height: 38)
                    
                    Spacer()
                    
                    Text("New teacher")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .heavy))
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        Image(systemName: "trash.fill")
                            .resizable()
                            .foregroundStyle(.gray)
                            .frame(width: 14, height: 18)
                        
                    }).frame(width: 38, height: 38)
                }
                
                //MARK: - Photo
                    Button {
                        vm.isPresentedPiker.toggle()
                    } label: {
                        Image(uiImage: vm.simpleTeacherPhoto)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 128, height: 128)
                            .cornerRadius(33)
                    }.frame(width: 128, height: 128)
                    .sheet(isPresented: $vm.isPresentedPiker, content: {
                        PhotoPicker(configuration: self.config, pickerResult: $vm.simpleTeacherPhoto, isPresented: $vm.isPresentedPiker)
                    })
                
                //MARK: - Name text field
                CustomTextFieldView(placeholder: "Name", text: $vm.simpleTeacherName)
                    .padding(.top)
                    .focused($keyboardIsFocus)
                
                //MARK: - Surname text field
                CustomTextFieldView(placeholder: "Sername", text: $vm.simpleTeacherSerName)
                    .focused($keyboardIsFocus)
                
                
                Spacer()
                
                //MARK: - Save button
                Button(action: {
                    if isEdite{
                        vm.updateTeacher()
                        vm.isPresentEdiiteteacher.toggle()
                    }else{
                        vm.addTeacher()
                        vm.isPresentAddteacher.toggle()
                    }
                    
                }, label: {
                    CustomButtonView(text: isEdite ? "Save" : "Add")
                })
                
            }.padding()
        }.onTapGesture {
            keyboardIsFocus = false
        }.onAppear(perform: {
            print(isEdite)
            if isEdite {
                vm.fillData()
            }
        })
    }
}

#Preview {
    AddTeacherView(vm: MainViewModel())
}
