//
//  iLocalConnectApp.swift
//  iLocalConnect
//
//  Created by Noah Little on 25/12/2022.
//

import SwiftUI

@main
struct iLocalConnectApp: App {
    var body: some Scene {
        MenuBarExtra {
            MenuBarView()
        } label: {
            HStack {
                Image(systemName: "terminal")
                Text("iLocalConnect")
            }
        }
        .menuBarExtraStyle(.window)
    }
}
