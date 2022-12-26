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
    
    @Published var isVisibleSettings: Bool = false
    
    var isInstalledHomebrew: Bool {
        return FileManager.default.fileExists(atPath: "/opt/homebrew/bin/brew")
    }
    
    func isInstalledIProxy() async -> Bool {
        let (output, _) = await ScriptHelper().shell("/usr/bin/which", ["iproxy"])
        return output != nil
    }
}
