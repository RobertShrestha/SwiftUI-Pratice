//
//  ContentView.swift
//  VIewBuilderTesting
//
//  Created by Robert Shrestha on 2/22/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                AlertView{
                    Image(systemName: "exclamationmark.shield.fill")
                        .resizable()
                        .frame(width: 65, height: 65)
                    Text("Here is a custom alert with view builders!")
                }

            }
            .navigationTitle("View Builders")
        }
    }
}
struct AlertView<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        VStack {
            content
                .padding()
            Divider()
            HStack {
                Button(action: {}) {
                    Text("Cancel")
                        .bold()
                        .foregroundColor(.red)
                }
                Spacer()
                Button(action: {}) {
                    Text("Confirm")
                        .bold()
                        .foregroundColor(.white)
                }
            }
            .padding()
        }

        .frame(width: UIScreen.main.bounds.size.width/2)
        .background(Color.blue)
        .cornerRadius(8)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
