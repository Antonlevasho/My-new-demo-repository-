//
//  ToDoModel.swift
//  ToDoListProgram
//
//  Created by Анастасия on 04.02.2024.
//

import Foundation
import UIKit
//MARK: -
var ToDoItem: [[String: Any ]] {
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoData") as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
    
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoData")
        UserDefaults.standard.synchronize()
        
    }
}

//MARK: -
func addItem(nameItem: String, isComplited: Bool = false) {
    ToDoItem.append(["Name": nameItem, "isComplited": false])
}

func removedItem(at index: Int) {
    ToDoItem.remove(at: index)
}

func moveItem(fromIndex: Int, toIndex: Int) {
    let from = ToDoItem[fromIndex]
    ToDoItem.remove(at: fromIndex)
    ToDoItem.insert(from, at: toIndex)
}

func changeState(at item: Int) -> Bool {
    ToDoItem[item]["isComplited"] = !(ToDoItem[item]["isComplited"] as! Bool)
    
    return (ToDoItem[item]["isComplited"] != nil)
}
    
