//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Jason Cox on 8/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.teal
                Color.white
            }
//                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            Text("Your content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
