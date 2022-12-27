//
//  MenuBarView.swift
//  iLocalConnect
//
//  Created by Noah Little on 25/12/2022.
//

import SwiftUI

// MARK: - Public

struct MenuBarView: View {
    @EnvironmentObject var prefs: iLCPrefs
    @State private var isInstallediProxy: Bool = true
    
    var body: some View {
        VStack(alignment: .center) {
            buttonsGroup
            settings
            suggestions
        }
        .padding()
        .backgroundStyle(.regularMaterial)
        .frame(maxWidth: .infinity)
        .task {
            isInstallediProxy = await prefs.isInstalledIProxy()
        }
    }
}

// MARK: - Private

private extension MenuBarView {
    var enabledButton: some View {
        Button {
            prefs.isEnabled.toggle()
        } label: {
            VStack {
                Image(systemName: prefs.isEnabled ? "checkmark" : "xmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(prefs.isEnabled ? Color.green : Color.red)
                    .clipShape(Circle())
                Text(prefs.isEnabled ? "Enabled" : "Disabled")
            }
        }
        .buttonStyle(.borderless)
    }
    
    var connectButton: some View {
        Button {
            ActionManager.shared.connectWithTerminal()
        } label: {
            VStack {
                Image(systemName: "terminal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(prefs.isEnabled ? Color.blue : Color.gray)
                    .clipShape(Circle())
                Text("Connect")
            }
        }
        .buttonStyle(.borderless)
        .disabled(!prefs.isEnabled)
    }
    
    var settingsButton: some View {
        Button {
            ActionManager.shared.toggleisVisibleSettings()
        } label: {
            VStack {
                Image(systemName: prefs.isVisibleSettings ? "chevron.down" : "chevron.right")
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
            enabledButton
            connectButton
            settingsButton
        }
    }
    
    @ViewBuilder
    var settings: some View {
        if prefs.isVisibleSettings {
            Divider()
            MenuBarSettingsView()
        }
    }
    
    var suggestions: some View {
        VStack {
            if !prefs.isInstalledHomebrew {
                SuggestionView(suggestionType: .homebrew)
            }
            if !isInstallediProxy {
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
