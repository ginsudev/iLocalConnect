//
//  MenuBarSettingsView.swift
//  iLocalConnect
//
//  Created by Noah Little on 26/12/2022.
//

import SwiftUI

// MARK: - Public

struct MenuBarSettingsView: View {
    @StateObject private var viewModel = ViewModel()
    
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
                .font(.title)
            TextField("root", text: $viewModel.usernameText)
                .textFieldStyle(.roundedBorder)
                .onChange(of: viewModel.usernameText) { newValue in
                    viewModel.sync(type: .username)
                }
        }
    }
    
    var portInput: some View {
        VStack(alignment: .leading) {
            Text("Port:")
                .font(.title)
            TextField("2222", text: $viewModel.portText)
                .textFieldStyle(.roundedBorder)
                .onChange(of: viewModel.portText) { newValue in
                    viewModel.sync(type: .port)
                }
        }
    }
}

// MARK: - Previews

struct MenuBarSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarSettingsView()
    }
}
