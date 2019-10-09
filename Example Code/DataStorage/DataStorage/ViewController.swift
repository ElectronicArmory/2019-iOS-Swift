//
//  ViewController.swift
//  DataStorage
//
//  Created by Mike Z on 10/3/19.
//  Copyright © 2019 Boise State. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let context = DatabaseController.managedObjectContainer().viewContext
        
        let person:Person = Person(context: context)
        person.personName = "Andy"
        person.personAge = 10
        person.car = Car(context: context)
        
        person.car?.make = "Toyota"
        
        
        let personFetchRequest:NSFetchRequest = Person.fetchRequest()
        let sortKey:String = "personAge"
        let sortDescriptor:NSSortDescriptor = NSSortDescriptor(key: sortKey, ascending: false)
        
        personFetchRequest.sortDescriptors = [sortDescriptor]
        
                let fetchPredicate:NSPredicate = NSPredicate(format: "personName == %@", "Andy") //
                personFetchRequest.predicate = fetchPredicate
        
        do{
            let fetchResults = try DatabaseController.managedObjectContainer().viewContext.fetch(personFetchRequest)
            
            if( fetchResults.count > 0 ){
                
                print(fetchResults)
                
                for person in fetchResults {
                    print( person.personName )
                }
            }
            else{
                // TODO: Nothing, handle it
            }
        }
        catch{
            print(exception.self)
        }
        
        DatabaseController.saveContext()
    }


}

