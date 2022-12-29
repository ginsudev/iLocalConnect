//
//  MenuBarSettingsView.swift
//  iLocalConnect
//
//  Created by Noah Little on 26/12/2022.
//

import SwiftUI
import LaunchAtLogin

// MARK: - Public

struct MenuBarSettingsView: View {
    @EnvironmentObject var prefs: iLCPrefs
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        Form {
            usernamePortInput
            toggles
            buttons
            versionText
        }
        .formStyle(.grouped)
    }
}

// MARK: - Private

private extension MenuBarSettingsView {
    var usernamePortInput: some View {
        VStack(alignment: .leading) {
            TextField("Username", text: $prefs.username)
                .textFieldStyle(.roundedBorder)
            TextField("Port", text: $prefs.port)
                .textFieldStyle(.roundedBorder)
        }
    }
    
    var toggles: some View {
        VStack {
            Toggle("Disable when asleep", isOn: $prefs.canDisableWhenAsleep)
                .toggleStyle(.switch)
            LaunchAtLogin.Toggle()
                .toggleStyle(.switch)
        }
    }
    
    var buttons: some View {
        VStack {
            Button {
                if let url = URL(string: "https://twitter.com/ginsudev") {
                    openURL(url)
                }
            } label: {
                Text("Follow @ginsudev on Twitter")
                    .frame(maxWidth: .infinity)
            }
            Button {
                if let url = URL(string: "https://github.com/ginsudev/iLocalConnect/releases") {
                    openURL(url)
                }
            } label: {
                Text("Check for updates")
                    .frame(maxWidth: .infinity)
            }
            Button {
                prefs.resetPreferences()
            } label: {
                Text("Reset preferences")
                    .frame(maxWidth: .infinity)
            }
            Button {
                NSApplication.shared.terminate(self)
            } label: {
                Text("Quit")
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    var versionText: some View {
        Text(prefs.appVersion)
            .font(.body)
    }
}

// MARK: - Previews

struct MenuBarSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarSettingsView()
    }
}
