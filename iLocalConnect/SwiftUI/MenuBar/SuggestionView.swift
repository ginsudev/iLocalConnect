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
            buttonAction()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.orange)
                description
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .buttonStyle(.borderless)
    }
}

// MARK: - Private

private extension SuggestionView {
    var description: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                Text(viewModel.suggestionType.title())
                    .font(.headline)
            }
            Text(viewModel.suggestionType.subtitle())
                .font(.body)
        }
        .foregroundColor(.white)
        .multilineTextAlignment(.leading)
        .padding()
    }
    
    func buttonAction() {
        if viewModel.suggestionType == .homebrew {
            let url = URL(string: "https://brew.sh")!
            NSWorkspace.shared.open(url)
        } else {
            if let command = viewModel.suggestionType.command() {
                ScriptHelper().openTerminal(withCommand: command)
            }
        }
    }
}

struct SuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestionView(suggestionType: .homebrew)
    }
}
