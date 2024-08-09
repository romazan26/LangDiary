//
//  RegistrationViewModel.swift
//  FastTrack
//
//  Created by Роман on 24.07.2024.
//

import Foundation
import CoreData
import UIKit

final class RegistrationViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published var users: [User] = []
    
    @Published var simpleName = ""
    @Published var simpleSurname = ""
    @Published var simpleLanguage = ""
    @Published var simpleImage: UIImage = UIImage(resource: .noFoto)
    
    @Published var isPresentLangDiary = false
    @Published var isPresentedPiker = false

    
    init(){
        getUser()
    }
    
    //MARK: - delete all user
    func deleteUsers(){
        for user in users {
            manager.container.viewContext.delete(user)
        }
        save()
        clear()
    }
    
    //MARK: - Add usesr
    func addUser(){
        let newUser = User(context: manager.context)
        newUser.name = simpleName
        newUser.serName = simpleSurname
        newUser.language = simpleLanguage
        newUser.photo = simpleImage
        
        save()
        clear()
        
    }
    
    //MARK: - Get data
    func getUser(){
        let request = NSFetchRequest<User>(entityName: "User")
        
        do{
            users = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Clear property
    func clear(){
        simpleName = ""
        simpleSurname = ""
        simpleLanguage = ""
    }
    
    //MARK: - Save data
    func save(){
        users.removeAll()
        manager.save()
        getUser()
    }
}
