//
//  iLocalConnectApp.swift
//  iLocalConnect
//
//  Created by Noah Little on 25/12/2022.
//

import SwiftUI
import AVKit

// MARK: - Public

@main
struct iLocalConnectApp: App {
    @ObservedObject var prefs = iLCPrefs.shared
    
    var body: some Scene {
        MenuBarExtra {
            MenuBarView()
                .environmentObject(prefs)
                .fixedSize(
                    horizontal: false,
                    vertical: false
                )
        } label: {
            menuBarFace
        }
        .menuBarExtraStyle(.window)
    }
}

// MARK: - Private

private extension iLocalConnectApp {
    var menuBarFace: some View {
        HStack {
            Image(systemName: prefs.isEnabled ? "iphone" : "iphone.slash")
            Text(prefs.isEnabled ? "Enabled" : "Disabled")
        }
        .onReceive(NSWorkspace.shared.notificationCenter.publisher(for: NSWorkspace.willSleepNotification)) { _ in
            if prefs.isEnabled, prefs.canDisableWhenAsleep {
                prefs.isEnabled = false
                prefs.isTemporarilyDisabledDueToSleep = true
            }
        }
        .onReceive(NSWorkspace.shared.notificationCenter.publisher(for: NSWorkspace.didWakeNotification)) { _ in
            if prefs.canDisableWhenAsleep, prefs.isTemporarilyDisabledDueToSleep {
                prefs.isEnabled = true
                prefs.isTemporarilyDisabledDueToSleep = false
            }
        }
    }
}
