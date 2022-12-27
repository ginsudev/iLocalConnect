//
//  MenuBarView.ViewModel.swift
//  iLocalConnect
//
//  Created by Noah Little on 25/12/2022.
//

import Foundation

extension MenuBarView {
    final class ViewModel: ObservableObject {
        @Published var isInstallediProxy: Bool = true
    }
}
