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
    
    var body: some View {
        Form {
            usernamePortInput
            toggles
            resetButton
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
    
    var resetButton: some View {
        Button {
            prefs.resetPreferences()
        } label: {
            Text("Reset preferences")
                .frame(maxWidth: .infinity)
        }
    }
}

// MARK: - Previews

struct MenuBarSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarSettingsView()
    }
}
