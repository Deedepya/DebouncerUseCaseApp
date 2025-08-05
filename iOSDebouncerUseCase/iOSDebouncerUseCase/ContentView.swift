//
//  ContentView.swift
//  iOSDebouncerUseCase
//
//  Created by dedeepya reddy salla on 04/08/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            NoDebounceView()
            .tabItem {
                Label("No Debounce", systemImage: "house")
            }

            DebounceView()
            .tabItem {
                Label("Debounce", systemImage: "house")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
