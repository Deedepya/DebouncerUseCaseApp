//
//  WithoutDebounceView.swift
//  iOSDebouncerUseCase
//
//  Created by dedeepya reddy salla on 04/08/25.
//

import SwiftUI

struct NoDebounceView: View {
    @State private var searchText = ""

    var body: some View {
        VStack {
            TextField("Type to search", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: searchText) { newValue in
                    performAPICall(query: newValue)
                }

            Text("Searching for: \(searchText)")
                .padding()
        }
        .padding()
    }

    func performAPICall(query: String) {
        guard !query.isEmpty else { return }
        print("NoDebounced API called with query: \(query)")
        // Simulate network delay of 300 milliseconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            print("NoDebounced API call completed for query: \(query)")
        }
    }
}

struct NoDebounceView_Previews: PreviewProvider {
    static var previews: some View {
        NoDebounceView()
    }
}
