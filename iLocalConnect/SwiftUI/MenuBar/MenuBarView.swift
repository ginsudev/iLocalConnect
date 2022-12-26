//
//  MenuBarView.swift
//  iLocalConnect
//
//  Created by Noah Little on 25/12/2022.
//

import SwiftUI

// MARK: - Public

struct MenuBarView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            List {
                buttonsGroup
                settings
                suggestions
            }
        }
        .frame(maxWidth: .infinity)
        .onAppear {
            Task {
                viewModel.isInstallediProxy = await Settings.isInstalledIProxy()
            }
        }
    }
}

// MARK: - Private

private extension MenuBarView {
    var enabledButton: some View {
        Button {
            viewModel.actionManager?.toggleEnabled()
        } label: {
            VStack {
                Image(systemName: viewModel.isEnabled ? "checkmark" : "xmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(viewModel.isEnabled ? Color.green : Color.red)
                    .clipShape(Circle())
                Text(viewModel.isEnabled ? "Enabled" : "Disabled")
            }
        }
        .buttonStyle(.borderless)
    }
    
    var connectButton: some View {
        Button {
            viewModel.actionManager?.connectWithTerminal()
        } label: {
            VStack {
                Image(systemName: "terminal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(viewModel.isEnabled ? Color.blue : Color.gray)
                    .clipShape(Circle())
                Text("Connect")
            }
        }
        .buttonStyle(.borderless)
        .disabled(!viewModel.isEnabled)
    }
    
    var settingsButton: some View {
        Button {
            viewModel.actionManager?.toggleisVisibleSettings()
        } label: {
            VStack {
                Image(systemName: viewModel.isVisibleSettings ? "chevron.down" : "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color.blue)
                    .clipShape(Circle())
                Text("Settings")
            }
        }
        .buttonStyle(.borderless)
    }
    
    var buttonsGroup: some View {
        HStack(spacing: 20) {
            Spacer()
            enabledButton
            connectButton
            settingsButton
            Spacer()
        }
    }
    
    @ViewBuilder
    var settings: some View {
        if viewModel.isVisibleSettings {
            Divider()
            MenuBarSettingsView()
        }
    }
    
    var suggestions: some View {
        VStack {
            if !Settings.isInstalledHomebrew {
                SuggestionView(suggestionType: .homebrew)
            }
            if !viewModel.isInstallediProxy {
                SuggestionView(suggestionType: .iproxy)
            }
        }
    }
}

// MARK: - Previews

struct MenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView()
    }
}
