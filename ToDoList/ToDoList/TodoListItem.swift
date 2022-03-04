//
//  TodoListItem.swift
//  ToDoList
//
//  Created by Robert Shrestha on 2/15/22.
//

import Foundation
import CoreData

class TodoListItem: NSManagedObject, Identifiable {
    @NSManaged var name: String?
    @NSManaged var createdAt: Date?
}
extension TodoListItem {
    static func getAllToDoListItems() -> NSFetchRequest<TodoListItem> {
        let request: NSFetchRequest<TodoListItem> = TodoListItem.fetchRequest() as! NSFetchRequest<TodoListItem>
        let sort = NSSortDescriptor(key: "createdAt", ascending: true)
        request.sortDescriptors = [sort]
        return request
    }
}
