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
        scriptHelper.openTerminal(withCommand: "ssh \(Settings.username)@localhost -p \(Settings.port)")
    }
}
