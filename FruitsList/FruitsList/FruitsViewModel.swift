//
//  FruitsViewModel.swift
//  FruitsList
//
//  Created by Robert Shrestha on 2/17/22.
//

import Foundation

class FruitsViewModel: ObservableObject {
    @Published var fruits: [FruitsModel] = []

    init() {
        fetch()
    }
    func deleteFruit(fruit: FruitsModel) {
        guard let fruit = fruits.firstIndex(of: fruit) else { return }
        fruits.remove(at: fruit)
    }

    func fetch() {
        let fruits1 = FruitsModel(name: "Apple", count: 5)
        let fruits2 = FruitsModel(name: "Orange", count: 2)
        let fruits3 = FruitsModel(name: "Banana", count: 12)
        fruits.append(fruits1)
        fruits.append(fruits2)
        fruits.append(fruits3)
    }

    func removeFruit(atIndex: IndexSet) {
        fruits.remove(atOffsets: atIndex)
    }
}
