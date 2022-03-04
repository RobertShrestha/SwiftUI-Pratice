//
//  FruitDetail.swift
//  FruitsList
//
//  Created by Robert Shrestha on 2/17/22.
//

import SwiftUI

struct FruitDetail: View {
    @Environment(\.presentationMode) var presentationMode
    var fruit: FruitsModel
    @Binding var fruitToDelete: FruitsModel
    var body: some View {
        VStack {
            Text(fruit.name)
            Text("\(fruit.count)")
            Button {
                print("Delete")
                presentationMode.wrappedValue.dismiss()
                fruitToDelete = fruit
            } label: {
                Text("Delete")
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: 100, height: 50)
            .background(.red)
            .cornerRadius(10)
        }
    }
}

struct FruitDetail_Previews: PreviewProvider {
    @State static var idTodelete: FruitsModel  = FruitsModel(name: "Apple", count: 5)
    static var previews: some View {

        FruitDetail(fruit: FruitsModel(name: "", count: 0), fruitToDelete: $idTodelete)
    }
}
