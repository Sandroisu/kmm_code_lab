//
//  ContentView.swift
//  KMPGetStartedCodelab
//
//
import sharedKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, \(Platform_iosKt.platform())!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
