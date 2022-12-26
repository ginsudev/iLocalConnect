//
//  Settings.swift
//  iLocalConnect
//
//  Created by Noah Little on 26/12/2022.
//

import Foundation

struct Settings {
    static var isEnabled: Bool {
        get {
            UserDefaults.standard.bool(forKey: "iLocalConnect.isEnabled")
        }
        
        set  {
            UserDefaults.standard.set(newValue, forKey: "iLocalConnect.isEnabled")
        }
    }
    
    static var username: String {
        get {
            UserDefaults.standard.string(forKey: "iLocalConnect.username") ?? "root"
        }
        
        set  {
            UserDefaults.standard.set(newValue, forKey: "iLocalConnect.username")
        }
    }
    
    static var port: String {
        get {
            UserDefaults.standard.string(forKey: "iLocalConnect.port") ?? "2222"
        }
        
        set  {
            UserDefaults.standard.set(newValue, forKey: "iLocalConnect.port")
        }
    }
}
