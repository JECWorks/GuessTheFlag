//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jason Cox on 8/4/24.
//

import SwiftUI

struct ContentView: View {
    func executeDelete() {
        print("Now deleting")
    }
    var body: some View {
        VStack {
            Text("Your content")
            Button("Delete selection", role: .destructive, action: executeDelete)
                .buttonStyle(.bordered)
            Button("Button 2") {
                print("Button 2 was tapped")
            }
            .buttonStyle(.borderedProminent)
            Button {
                print("Button3 tapped")
            } label: {
                Image(systemName: "pencil.circle")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.blue)
            }
            Button("Edit", systemImage: "pencil") {
                print("Edit button tapped")
            }
            Button {
                print("Edit button was tapped")
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.blue)
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
            .background(.teal.gradient)
    }
}

#Preview {
    ContentView()
}
