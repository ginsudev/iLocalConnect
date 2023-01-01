//
//  MenuBarActions.swift
//  iLocalConnect
//
//  Created by Noah Little on 25/12/2022.
//

import Foundation
import ServiceManagement

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
        if let iproxyPath = iLCPrefs.shared.pathForFile(withName: "iproxy") {
            do {
                try await scriptHelper.shell(iproxyPath, ["\(iLCPrefs.shared.port):22"])
            } catch {
                print(error)
            }
        }
    }
    
    func killiProxy() async {
        do {
            try await scriptHelper.shell("/usr/bin/killall", ["iproxy"])
        } catch {
            print(error)
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
    
    func registerLoginItem(enabled: Bool) {
        if enabled {
            try? SMAppService().register()
        } else{
            try? SMAppService().unregister()
        }
    }
}
