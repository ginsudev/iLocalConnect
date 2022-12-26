//
//  iLocalConnectApp.ViewModel.swift
//  iLocalConnect
//
//  Created by Noah Little on 26/12/2022.
//

import Foundation
import Cocoa

extension iLocalConnectApp {
    final class ViewModel: ObservableObject {
        
        private init() {
            NSWorkspace.shared.notificationCenter.addObserver(
                self,
                selector: #selector(isSleepingDidChange(_:)),
                name: NSWorkspace.willSleepNotification,
                object: nil
            )
            
            NSWorkspace.shared.notificationCenter.addObserver(
                self,
                selector: #selector(isSleepingDidChange(_:)),
                name: NSWorkspace.didWakeNotification,
                object: nil
            )
        }
        
        @objc private func isSleepingDidChange(_ notification: NSNotification) {
            if notification.name == NSWorkspace.willSleepNotification {
                
            } else if notification.name == NSWorkspace.didWakeNotification {
                
            }
        }
    }
}
