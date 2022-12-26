//
//  iLocalConnectApp.swift
//  iLocalConnect
//
//  Created by Noah Little on 25/12/2022.
//

import SwiftUI

@main
struct iLocalConnectApp: App {
    @ObservedObject var prefs = iLCPrefs.shared
    
    var body: some Scene {
        MenuBarExtra {
            MenuBarView()
                .environmentObject(prefs)
                .fixedSize(horizontal: false, vertical: false)
        } label: {
            HStack {
                Image(systemName: prefs.isEnabled ? "iphone" : "iphone.slash")
                Text(prefs.isEnabled ? "Enabled" : "Disabled")
            }
        }
        .menuBarExtraStyle(.window)
    }
}
