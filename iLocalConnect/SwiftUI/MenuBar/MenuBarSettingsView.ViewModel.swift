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
        @Published var usernameText: String = Settings.username
        @Published var portText: String = Settings.port
        
        func sync(type: PropertyType) {
            switch type {
            case .username:
                Settings.username = usernameText
            case .port:
                Settings.port = portText
            }
        }
    }
}
