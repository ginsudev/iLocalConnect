//
//  MenuBarActions.swift
//  iLocalConnect
//
//  Created by Noah Little on 25/12/2022.
//

import Foundation

final class MenuBarActionManager {
    private let scriptHelper = ScriptHelper()
    
    func toggleEnabled() {
        iLCPrefs.shared.isEnabled.toggle()
        
        Task(priority: .background) { [weak self] in
            if iLCPrefs.shared.isEnabled {
                await self?.scriptHelper.shell("/opt/homebrew/bin/iproxy", ["\(iLCPrefs.shared.port):22"])
            } else {
                await self?.scriptHelper.shell("/usr/bin/killall", ["iproxy"])
            }
        }
    }
    
    func toggleisVisibleSettings() {
        iLCPrefs.shared.isVisibleSettings.toggle()
    }
    
    func connectWithTerminal() {
        scriptHelper.openTerminal(
            withCommand: "ssh \(iLCPrefs.shared.username)@localhost -p \(iLCPrefs.shared.port)"
        )
    }
}
