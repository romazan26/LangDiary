//
//  User+CoreDataProperties.swift
//
//
//  Created by Роман on 09.08.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(User)
public class User: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var language: String?
    @NSManaged public var name: String?
    @NSManaged public var photo: UIImage?
    @NSManaged public var serName: String?

}

extension User : Identifiable {

}
