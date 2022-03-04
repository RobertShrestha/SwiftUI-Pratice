//
//  ContentView.swift
//  FruitsList
//
//  Created by Robert Shrestha on 2/17/22.
//

import SwiftUI

struct ContentView: View {
    // @State var fruits: [FruitsModel] = []
    @StateObject var viewModel = FruitsViewModel()
    @State var fruitToDelete: FruitsModel = FruitsModel(name: "Apple", count: 5)
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.fruits, id: \.id) { fruit in
                    NavigationLink(destination: FruitDetail(fruit: fruit, fruitToDelete: $fruitToDelete), label: {
                        HStack {
                            Text("\(fruit.count)")
                                .font(.subheadline)
                                .foregroundColor(.red)
                            Text(fruit.name)
                                .font(.headline)
                        }
                    })

                }
                .onDelete(perform: viewModel.removeFruit(atIndex:))
                .onAppear {
                    viewModel.deleteFruit(fruit: fruitToDelete)
                }
            }
            .navigationTitle("Fruits List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
