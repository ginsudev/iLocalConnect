//
//  ScriptHelper.swift
//  iLocalConnect
//
//  Created by Noah Little on 26/12/2022.
//

import Foundation

struct ScriptHelper {
    func script(fromCommand command: String) -> String {
        """
        tell application "Terminal"
            if not (exists window 1) then reopen
            activate
            do script "\(command)" in window 1
        end tell
        """
    }
    
    func openTerminal(withCommand command: String) {
        Task(priority: .background) {
            var error: NSDictionary?
            let script = script(fromCommand: command)
            
            if let object = NSAppleScript(source: script) {
                let output = object.executeAndReturnError(&error)
                if let error {
                    print("error: \(error)")
                } else {
                    print(output.stringValue ?? "Succeeded")
                }
            }
        }
    }
    
    @discardableResult
    func shell(_ launchPath: String, _ arguments: [String] = []) async throws -> (String?, Int32) {
        let pipe = Pipe()
        let task = Process()
        task.executableURL = URL(fileURLWithPath: launchPath)
        task.arguments = arguments
        task.standardOutput = pipe
        task.standardError = pipe
        
        try task.run()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)
        
        task.waitUntilExit()
        return (output, task.terminationStatus)
    }
}
