//
//  Model.swift
//  Task1
//
//  Created by Artem Antuh on 10/25/18.
//  Copyright © 2018 Artem Antuh. All rights reserved.
//

import Foundation

var projectItems: [[String : Any]] {
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

func addProjectItem(nameProjectItem: String,shortnameProjectItem: String,  isCompleted: Bool = false){
    projectItems.append(["Name":nameProjectItem, "isCompleted": false])
//    projectItems.append(["ShortName": shortnameProjectItem, "isCompleted":false])
}

func removeProjectItem(at index: Int) {
    projectItems.remove(at: index)

}

func moveProjectItem(fromIndex: Int, toIndex: Int) {
    let from = projectItems[fromIndex]
    projectItems.remove(at: fromIndex)
    projectItems.insert(from, at: toIndex)
}

func changeProjectState(at item: Int) -> Bool{
    projectItems[item]["isCompleted"] = !(projectItems[item]["isCompleted"] as! Bool)


    return projectItems[item]["isCompleted"] as! Bool
}
