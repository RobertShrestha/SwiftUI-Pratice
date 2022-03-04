//
//  FruitsModel.swift
//  FruitsList
//
//  Created by Robert Shrestha on 2/17/22.
//

import Foundation
struct FruitsModel: Hashable, Identifiable, Equatable {
    var id: String = UUID().uuidString
    var name: String
    var count: Int
}

