//
//  MenuBarSettingsView.ViewModel.swift
//  iLocalConnect
//
//  Created by Noah Little on 26/12/2022.
//

import Foundation

extension MenuBarSettingsView {
    enum PropertyType {
        case username
        case port
    }
    
    final class ViewModel: ObservableObject {
        @Published var usernameText: String = iLCPrefs.shared.username
        @Published var portText: String = iLCPrefs.shared.port
        
        func sync(type: PropertyType) {
            switch type {
            case .username:
                iLCPrefs.shared.username = usernameText
            case .port:
                iLCPrefs.shared.port = portText
            }
        }
    }
}
