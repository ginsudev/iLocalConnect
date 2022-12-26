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
        static let shared = ViewModel()
        @Published var isEnabled: Bool = Settings.isEnabled
    }
}
