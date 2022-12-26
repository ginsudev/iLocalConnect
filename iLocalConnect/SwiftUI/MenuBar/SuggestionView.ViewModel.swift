//
//  SuggestionView.ViewModel.swift
//  iLocalConnect
//
//  Created by Noah Little on 26/12/2022.
//

import Foundation

extension SuggestionView {
    enum SuggestionType {
        case homebrew
        case iproxy
        
        func title() -> String {
            switch self {
            case .homebrew:
                return "Install Homebrew"
            case .iproxy:
                return "Install iProxy"
            }
        }
        
        func subtitle() -> String {
            switch self {
            case .homebrew:
                return "Homebrew was not found on the disk, it is recommended to install by clicking here."
            case .iproxy:
                return "iProxy was not found on the disk, it is recommended to install by clicking here."
            }
        }
        
        func command() -> String? {
            if self == .iproxy {
                return "brew install libimobiledevice"
            }
            return nil
        }
    }
    
    struct ViewModel {
        let suggestionType: SuggestionType
        
        init(suggestionType: SuggestionType) {
            self.suggestionType = suggestionType
        }
    }
}
