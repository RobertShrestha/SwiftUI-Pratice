//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Robert Shrestha on 2/15/22.
//

import SwiftUI

@main
struct ToDoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            ToDoListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
 
