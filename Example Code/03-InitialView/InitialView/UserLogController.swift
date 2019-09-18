//
//  UserLogController.swift
//  InitialView
//
//  Created by Mike Z on 9/12/19.
//  Copyright © 2019 Boise State. All rights reserved.
//

import Foundation

class UserLogController: NSObject {

    static var loggingArray = Array<String>() // Same as: [String]
    
    
    // Class functions allow you to call them without instantiating the class.
    //  Ex: var logArray = UserLogController.loggingList()
    class func loggingList() -> Array<String>{
        
        return UserLogController.loggingArray
    }
    

    // Static functions in a class can not be overridden by subclasses.
    //  Ex: UserLogController.logNewEvent(newEventToLog: outputString)
    static func logNewEvent(newEventToLog:String){
        UserLogController.loggingArray.append(newEventToLog)
        
        print(UserLogController.loggingArray) // print contents of array to console
    }
}
