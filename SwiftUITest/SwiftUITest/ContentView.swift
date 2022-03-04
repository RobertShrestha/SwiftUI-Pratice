//
//  ContentView.swift
//  SwiftUITest
//
//  Created by Robert Shrestha on 2/14/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .foregroundColor(.white)
                .background(.red)
            Button("Click me") {
                print("Button clicked")
            }
            Button(action: {
                print("Button clicked")
            }, label: {
                HStack {
                    Image(systemName: "pencil")
                    Text("Click me")
                }
            })
        }
//        VStack {
//            Spacer()
//            Image("LogoView")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .padding(10)
//
//            HStack() {
//                Spacer()
//                Text("Hello this text")
//                Spacer()
//                Text("Another stack")
//                Spacer()
//            }
//            Spacer()
//        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
