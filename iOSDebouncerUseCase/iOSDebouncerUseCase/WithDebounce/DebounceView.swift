//
//  WithDebounceView.swift
//  iOSDebouncerUseCase
//
//  Created by dedeepya reddy salla on 04/08/25.
//

import SwiftUI
import Combine

class DebouncedViewModel: ObservableObject {
    @Published var searchText = ""
    private var cancellable: AnyCancellable?

    init() {
        cancellable = $searchText
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .sink { [weak self] value in
                self?.performAPICall(query: value)
            }
    }

    func performAPICall(query: String) {
        guard !query.isEmpty else { return }
        print("Debounced API called with query: \(query)")
        // Simulate network delay of 300 milliseconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            print("Debounced API call completed for query: \(query)")
        }
    }
}

struct DebounceView: View {
    @StateObject private var viewModel = DebouncedViewModel()

    var body: some View {
        VStack {
            TextField("Type to search", text: $viewModel.searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Text("Searching for: \(viewModel.searchText)")
                .padding()
        }
        .padding()
    }
}


struct DebounceView_Previews: PreviewProvider {
    static var previews: some View {
        DebounceView()
    }
}
