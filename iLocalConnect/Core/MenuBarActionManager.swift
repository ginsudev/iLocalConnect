//
//  MenuBarActions.swift
//  iLocalConnect
//
//  Created by Noah Little on 25/12/2022.
//

import Foundation

final class MenuBarActionManager {
    weak var menuBarViewModel: MenuBarView.ViewModel?
    private let scriptHelper = ScriptHelper()
    
    init(menuBarViewModel: MenuBarView.ViewModel) {
        self.menuBarViewModel = menuBarViewModel
    }
    
    func toggleEnabled() {
        if let menuBarViewModel {
            menuBarViewModel.isEnabled.toggle()
            Settings.isEnabled = menuBarViewModel.isEnabled
        }
        
        Task(priority: .background) { [weak self] in
            if Settings.isEnabled {
                await self?.scriptHelper.shell("/opt/homebrew/bin/iproxy", ["\(Settings.port):22"])
                print("ran iproxy")
            } else {
                await self?.scriptHelper.shell("/usr/bin/killall", ["iproxy"])
                print("killed iproxy")
            }
        }
    }
    
    func toggleisVisibleSettings() {
        if let menuBarViewModel {
            menuBarViewModel.isVisibleSettings.toggle()
        }
    }
    
    func connectWithTerminal() {
        DispatchQueue.global(qos: .default).async { [weak self] in
            var error: NSDictionary?

            if let script = self?.scriptHelper.openTerminalScript(),
               let object = NSAppleScript(source: script) {
                let output = object.executeAndReturnError(&error)
                
                if let error {
                    print("error: \(error)")
                } else {
                    print(output.stringValue ?? "Succeeded")
                }
            }
        }
    }
}
