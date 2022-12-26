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
    }
    
    struct ViewModel {
        private(set) var suggestionType: SuggestionType
        
        init(suggestionType: SuggestionType) {
            self.suggestionType = suggestionType
        }
        
        lazy var title: String = {
            switch suggestionType {
            case .homebrew:
                return "Install Homebrew"
            case .iproxy:
                return "Install iProxy"
            }
        }()
        
        lazy var subtitle: String = {
            switch suggestionType {
            case .homebrew:
                return "Homebrew was not found on the disk, it is recommended to install by clicking here."
            case .iproxy:
                return "iProxy was not found on the disk, it is recommended to install by clicking here."
            }
        }()
        
        lazy var command: String = {
            switch suggestionType {
            case .homebrew:
                return "https://brew.sh"
            case .iproxy:
                return "brew install libimobiledevice"
            }
        }()
    }
}
