//
//  SwiftUIView.swift
//  SwiftUITest
//
//  Created by Robert Shrestha on 2/14/22.
//

import SwiftUI

struct WarView: View {
    @State private var playerCard = "card2"
    @State private var cpuCard = "card14"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    @State private var playerRand = 0
    @State private var cpuRand = 0
    @State private var degrees: Double = 0.0
    fileprivate func handleScore() {
        if playerRand > cpuRand {
            playerScore += 1
        } else if playerRand < cpuRand {
            cpuScore += 1
        }
    }

    fileprivate func handleRandom() {
        playerRand = Int.random(in: 2...14)
        cpuRand = Int.random(in: 2...14)

        playerCard = "card" + String(playerRand)
        cpuCard =  "card" + String(cpuRand)
    }

    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }
                Spacer()
                Button(action: {
                    handleRandom()
                    handleScore()
                    degrees = 180
                }, label: {
                    Image("dealbutton")
                })
                Spacer()
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
        .onAppear(perform: {
            handleRandom()
        })
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WarView()
    }
}
