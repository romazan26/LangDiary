//
//  MainViewModel.swift
//  LangDiary
//
//  Created by Роман on 09.08.2024.
//

import Foundation
import UIKit
import CoreData

final class MainViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published var teachers:[Teacher] = []
    @Published var words: [Word] = []
    
    //Words
    @Published var simpleWord1 = ""
    @Published var simpleWord2 = ""
    @Published var isAddWord = false
    
    //Teachers
    @Published var simpleTeacherName = ""
    @Published var simpleTeacherSerName = ""
    @Published var simpleTeacherPhoto: UIImage = UIImage(resource: .noFotoTeacher)
    
    @Published var isPresentAddteacher = false
    @Published var isPresentedPiker = false
    
    init(){
        getTeachers()
        getWords()
    }
    
    //MARK: - Add Data
    func addTeacher(){
        let newTeacher = Teacher(context: manager.context)
        newTeacher.name = simpleTeacherName
        newTeacher.serName = simpleTeacherSerName
        newTeacher.photo = simpleTeacherPhoto
        
        save()
        clearDataTeacher()
    }
    
    func addAllWords(){
        addWord(word: simpleWord1)
        addWord(word: simpleWord2)
        
        clearDataWords()
    }
    
    func addWord(word: String){
        let newWord = Word(context: manager.context)
        newWord.title = word
        
        save()
    }
    
    //MARK: - Get data
    func getTeachers(){
        let request = NSFetchRequest<Teacher>(entityName: "Teacher")
        
        do{
            teachers = try manager.context.fetch(request)
        }catch let error{
            print("Get data error \(error.localizedDescription)")
        }
    }
    
    func getWords(){
        let request = NSFetchRequest<Word>(entityName: "Word")
        
        do{
            words = try manager.context.fetch(request)
        }catch let error{
            print("Get data error \(error.localizedDescription)")
        }
    }
    
    //MARK: - Clear data
    func clearDataTeacher(){
        simpleTeacherName = ""
        simpleTeacherSerName = ""
        simpleTeacherPhoto = UIImage(resource: .addteacher)
    }
    
    func clearDataWords(){
        simpleWord1 = ""
        simpleWord2 = ""
    }
    
    //MARK: - Save data
    func save(){
        teachers.removeAll()
        words.removeAll()
        
        manager.save()
        
        getTeachers()
        getWords()
    }
}
