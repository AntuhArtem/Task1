//
//  tasksModel.swift
//  Task1
//
//  Created by Antyukh, Artjom on 10/26/18.
//  Copyright © 2018 Artem Antuh. All rights reserved.
//

import Foundation

var taskItems: [[String : Any]] {
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

func addTaskItem(nameTaskItem: String, isCompleted: Bool = false){
    taskItems.append(["Name":nameTaskItem, "isCompleted":false])
    
}

func removeTaskItem(at index: Int) {
    taskItems.remove(at: index)
    
}

func moveTaskItem(fromIndex: Int, toIndex: Int) {
    let from = taskItems[fromIndex]
    taskItems.remove(at: fromIndex)
    taskItems.insert(from, at: toIndex)
}

func changeTaskState(at item: Int) -> Bool{
    taskItems[item]["isCompleted"] = !(taskItems[item]["isCompleted"] as! Bool)
    
    
    return taskItems[item]["isCompleted"] as! Bool
}
