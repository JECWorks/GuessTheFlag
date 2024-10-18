//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jason Cox on 8/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var tries = 0
    @State private var rotationAmount = 0.0
    @State private var selectedFlag: Int? = nil
    
    let maxTries = 8

    func executeDelete() {
        print("Now deleting")
    }
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.6),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.secondary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                                .rotation3DEffect(
                                    .degrees(number == correctAnswer ? rotationAmount : 0),
                                    axis: (x: 0, y: 1, z: 0)
                                )
                                .opacity(selectedFlag == nil || selectedFlag == number || number == correctAnswer ? 1 : 0.25)  // Fade out incorrect flags

                                .animation(.easeInOut(duration: 1.0), value: rotationAmount)
                        }
                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 70))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if tries < maxTries {
                Button("Continue", action: askQuestion)
            } else {
                Button ("New Game", action: resetGame)
            }
        } message: {
            if tries < maxTries {
                Text("Your score is \(score) out of \(tries)")
            } else {
                Text("Game over! Your final score is \(score) out of \(tries)")
            }
        }
        
    }
    func flagTapped(_ number: Int) {
        selectedFlag = number
        if tries < maxTries {
            if number == correctAnswer {
                scoreTitle = "Correct"
                score += 1
                tries += 1
                rotationAmount += 360
            } else {
                scoreTitle = "Wrong, choice! That's the flag of \(countries[number])"
                tries += 1
            }
            
            showingScore = true
        }
        
        if tries >= maxTries {
            scoreTitle = "Game Over"
            showingScore = true
        }
    }
    
    func askQuestion () {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        rotationAmount = 0
        selectedFlag = nil
        
    }
    
    func resetGame() {
    score = 0
    tries = 0
    countries.shuffle()
    correctAnswer = Int.random(in: 0...2)
    rotationAmount = 0
    selectedFlag = nil
    }
}



#Preview {
    ContentView()
}
