//
//  MenuBarView.ViewModel.swift
//  iLocalConnect
//
//  Created by Noah Little on 25/12/2022.
//

import Foundation

extension MenuBarView {
    final class ViewModel: ObservableObject {
        var actionManager: MenuBarActionManager?
        
        @Published var isEnabled: Bool = Settings.isEnabled
        @Published var isVisibleSettings: Bool = false
        @Published var isInstallediProxy: Bool = true
        
        init() {
            self.actionManager = MenuBarActionManager(menuBarViewModel: self)
        }
    }
}
