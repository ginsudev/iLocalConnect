//
//  iLCPrefs.swift
//  iLocalConnect
//
//  Created by Noah Little on 26/12/2022.
//

import Foundation

final class iLCPrefs: ObservableObject {
    static let shared = iLCPrefs()
    
    @Published var isEnabled: Bool = UserDefaults.standard.bool(forKey: "iLocalConnect.isEnabled") {
        didSet {
            UserDefaults.standard.set(isEnabled, forKey: "iLocalConnect.isEnabled")
            ActionManager.shared.toggle(enable: isEnabled)
        }
    }
    
    @Published var username: String = UserDefaults.standard.string(forKey: "iLocalConnect.username") ?? "root" {
        didSet {
            UserDefaults.standard.set(username, forKey: "iLocalConnect.username")
        }
    }
    
    @Published var port: String = UserDefaults.standard.string(forKey: "iLocalConnect.port") ?? "2222" {
        didSet {
            UserDefaults.standard.set(port, forKey: "iLocalConnect.port")
        }
    }
    
    @Published var canDisableWhenAsleep: Bool = UserDefaults.standard.bool(forKey: "iLocalConnect.disableWhenAsleep") {
        didSet {
            UserDefaults.standard.set(canDisableWhenAsleep, forKey: "iLocalConnect.disableWhenAsleep")
        }
    }
    
    @Published var canLaunchAtLogin: Bool = UserDefaults.standard.bool(forKey: "iLocalConnect.canLaunchAtLogin") {
        didSet {
            UserDefaults.standard.set(canLaunchAtLogin, forKey: "iLocalConnect.canLaunchAtLogin")
            ActionManager.shared.registerLoginItem(enabled: canLaunchAtLogin)
        }
    }
    
    @Published var isVisibleSettings: Bool = false
    
    @Published var isTemporarilyDisabledDueToSleep: Bool = false
    
    var isInstalledHomebrew: Bool {
        return FileManager.default.fileExists(atPath: "/opt/homebrew/bin/brew")
    }
    
    var isInstalledIProxy: Bool {
        return FileManager.default.fileExists(atPath: "/opt/homebrew/bin/iproxy")
    }
    
    let appVersion = "Version: \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown version")"

    
    func resetPreferences() {
        isEnabled = false
        username = "root"
        port = "2222"
        canDisableWhenAsleep = false
    }
}
