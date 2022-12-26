//
//  MenuBarSettingsView.swift
//  iLocalConnect
//
//  Created by Noah Little on 26/12/2022.
//

import SwiftUI

// MARK: - Public

struct MenuBarSettingsView: View {
    @EnvironmentObject var prefs: iLCPrefs
    
    var body: some View {
        VStack {
            usernameInput
            Divider()
            portInput
        }
    }
}

// MARK: - Private

private extension MenuBarSettingsView {
    var usernameInput: some View {
        VStack(alignment: .leading) {
            Text("Username:")
                .font(.headline)
            TextField("root", text: $prefs.username)
                .textFieldStyle(.roundedBorder)
        }
    }
    
    var portInput: some View {
        VStack(alignment: .leading) {
            Text("Port:")
                .font(.headline)
            TextField("2222", text: $prefs.port)
                .textFieldStyle(.roundedBorder)
        }
    }
}

// MARK: - Previews

struct MenuBarSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarSettingsView()
    }
}
