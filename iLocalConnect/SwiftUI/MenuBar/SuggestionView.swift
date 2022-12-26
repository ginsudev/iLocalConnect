//
//  SuggestionView.swift
//  iLocalConnect
//
//  Created by Noah Little on 26/12/2022.
//

import SwiftUI
import Cocoa

// MARK: - Public

struct SuggestionView: View {
    @State private var viewModel: ViewModel
    
    init(suggestionType: SuggestionType) {
        self.viewModel = ViewModel(suggestionType: suggestionType)
    }
    
    var body: some View {
        Button {
            if viewModel.suggestionType == .homebrew {
                let url = URL(string: viewModel.command)!
                NSWorkspace.shared.open(url)
            } else {
                ScriptHelper().openTerminal(withCommand: viewModel.command)
            }
        } label: {
            description
                .background(RoundedRectangle(cornerRadius: 12).foregroundColor(.orange))
        }
        .buttonStyle(.borderless)
        .frame(maxWidth: .infinity, maxHeight: 200)
    }
}

// MARK: - Private

private extension SuggestionView {
    var description: some View {
        VStack {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                Text(viewModel.title)
                    .font(.headline)
                Spacer()
            }

            Text(viewModel.subtitle)
                .font(.body)
        }
        .multilineTextAlignment(.leading)
        .padding()
    }
}

struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView(suggestionType: .homebrew)
    }
}
