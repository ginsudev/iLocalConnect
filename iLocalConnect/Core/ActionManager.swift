//
//  MenuBarActions.swift
//  iLocalConnect
//
//  Created by Noah Little on 25/12/2022.
//

import Foundation

final class ActionManager {
    static let shared = ActionManager()
    private let scriptHelper = ScriptHelper()
    
    func toggle(enable: Bool) {
        Task(priority: .background) { [weak self] in
            if enable {
                await self?.startiProxy()
            } else {
                await self?.killiProxy()
            }
        }
    }
    
    func startiProxy() async {
        await scriptHelper.shell("/opt/homebrew/bin/iproxy", ["\(iLCPrefs.shared.port):22"])
    }
    
    func killiProxy() async {
        await scriptHelper.shell("/usr/bin/killall", ["iproxy"])
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