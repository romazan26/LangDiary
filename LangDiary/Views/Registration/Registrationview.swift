//
//  Registrationview.swift
//  FastTrack
//
//  Created by Роман on 24.07.2024.
//

import SwiftUI
import PhotosUI

struct Registrationview: View {
    @StateObject var vm = RegistrationViewModel()
    @FocusState private var keyboardIsFocus: Bool
    
    var config: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: .shared())
        config.filter = .images
        config.selectionLimit = 1
        
        return config
    }
    
    var body: some View {
        ZStack {
            //MARK: - Background
            Color.main.ignoresSafeArea()
            VStack {
                //MARK: - title
                Text("Registration")
                    .foregroundStyle(.white)
                    .font(.system(size: 37, weight: .heavy))
                    .padding(.vertical)
                
                    Button {
                        vm.isPresentedPiker.toggle()
                    } label: {
                        Image(uiImage: vm.simpleImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 149, height: 149)
                            .cornerRadius(70)
                    }.frame(width: 149, height: 149)
                    .sheet(isPresented: $vm.isPresentedPiker, content: {
                        PhotoPicker(configuration: self.config, pickerResult: $vm.simpleImage, isPresented: $vm.isPresentedPiker)
                    })
                
                
                //MARK: - Name text field
                CustomTextFieldView(placeholder: "Name", text: $vm.simpleName)
                    .padding(.top)
                    .focused($keyboardIsFocus)
                
                //MARK: - Surname text field
                CustomTextFieldView(placeholder: "Sername", text: $vm.simpleSurname)
                    .focused($keyboardIsFocus)
                
                //MARK: - Language text field
                CustomTextFieldView(placeholder: "Language", text: $vm.simpleLanguage)
                    .focused($keyboardIsFocus)
                
                Spacer()
                //MARK: - Begin button
                Button(action: {
                    vm.addUser()
                    vm.isPresentLangDiary.toggle()}, label: {
                    CustomButtonView(text: "Begin")
                        .opacity(vm.simpleName.isEmpty ? 0.5 : 1)
                })
                .disabled(vm.simpleName.isEmpty ? true : false)
                
                //MARK: - Skip button
                Button(action: { vm.isPresentLangDiary.toggle()}, label: {
                    Text("Skip")
                        .foregroundStyle(.orangeApp)
                        .font(.title2)
                        .opacity(0.8)
                })
                
            }.padding()
        }
        .fullScreenCover(isPresented: $vm.isPresentLangDiary, content: {
            MainView(vmRegistration: vm)
        })
        .onTapGesture {
            keyboardIsFocus = false
        }
    }
}

#Preview {
    Registrationview(vm: RegistrationViewModel())
}
