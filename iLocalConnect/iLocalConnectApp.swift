//
//  iLocalConnectApp.swift
//  iLocalConnect
//
//  Created by Noah Little on 25/12/2022.
//

import SwiftUI

@main
struct iLocalConnectApp: App {
    @StateObject private var viewModel = ViewModel.shared
    
    var body: some Scene {
        MenuBarExtra {
            MenuBarView()
                .fixedSize(horizontal: false, vertical: false)
        } label: {
            HStack {
                Image(systemName: viewModel.isEnabled ? "iphone" : "iphone.slash")
                Text(viewModel.isEnabled ? "Enabled" : "Disabled")
            }
        }
        .menuBarExtraStyle(.window)
    }
}
