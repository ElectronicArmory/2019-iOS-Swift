//
//  Person+CoreDataProperties.swift
//  DataStorage
//
//  Created by Mike Z on 10/3/19.
//  Copyright © 2019 Boise State. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var personName: String?
    @NSManaged public var personAge: Int16
    @NSManaged public var personDOB: Date?
    @NSManaged public var car: Car?

}
