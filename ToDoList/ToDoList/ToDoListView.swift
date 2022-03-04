//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Robert Shrestha on 2/15/22.
//

import SwiftUI
import CoreData

struct ToDoListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(fetchRequest: TodoListItem.getAllToDoListItems())
    var toLists: FetchedResults<TodoListItem>
    @State var text: String = ""
   // @State var toLists = ["Hello","I", "here"]
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("New task")) {
                    HStack {
                        TextField("Enter new item ...", text: $text)
                        Button {
                            if !text.isEmpty {
                                let newItem = TodoListItem(context: viewContext)
                                newItem.name = text
                                newItem.createdAt = Date()
                                do {
                                    try viewContext.save()
                                } catch {
                                    print(error)
                                }
                            }
                            text = ""
                        } label: {
                            Text("Save")
                        }

                    }

                }
                Section() {
                    ForEach(toLists, id: \.self) { item in
                        HStack {
                            Text(item.name ?? "")
                            Text("\(item.createdAt ?? Date())")
                        }
                    }.onDelete { indexSet in
                       guard let index = indexSet.first else { return }
                        let itemTodelete = toLists[index]
                        viewContext.delete(itemTodelete)
                        do {
                            try viewContext.save()
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            .navigationTitle("To Do List 📝")
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
