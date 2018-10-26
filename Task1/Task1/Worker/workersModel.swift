//
//  workersModel.swift
//  Task1
//
//  Created by Antyukh, Artjom on 10/26/18.
//  Copyright © 2018 Artem Antuh. All rights reserved.
//

import Foundation

var workersItems: [[String : Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    
    get {
        if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String : Any]] {
            return array
        }else {
            return []
        }
    }
}

func addWorkerItem(nameWorkerItem: String, isCompleted: Bool = false){
    workersItems.append(["Name":nameWorkerItem, "isCompleted":false])
    
}

func removeWorkerItem(at index: Int) {
    workersItems.remove(at: index)
    
}

func moveWorkerItem(fromIndex: Int, toIndex: Int) {
    let from = workersItems[fromIndex]
    workersItems.remove(at: fromIndex)
    workersItems.insert(from, at: toIndex)
}

func changeWorkerState(at item: Int) -> Bool{
    workersItems[item]["isCompleted"] = !(workersItems[item]["isCompleted"] as! Bool)
    
    
    return workersItems[item]["isCompleted"] as! Bool
}
