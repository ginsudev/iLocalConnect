//
//  ScriptHelper.swift
//  iLocalConnect
//
//  Created by Noah Little on 26/12/2022.
//

import Foundation

struct ScriptHelper {
    func openTerminalScript() -> String {
        """
        tell application "Terminal"
            if not (exists window 1) then reopen
            activate
            do script "ssh \(Settings.username)@localhost -p \(Settings.port)" in window 1
        end tell
        """
    }
    
    @discardableResult
    func shell(_ launchPath: String, _ arguments: [String] = []) async -> (String?, Int32) {
      let task = Process()
      task.executableURL = URL(fileURLWithPath: launchPath)
      task.arguments = arguments

      let pipe = Pipe()
      task.standardOutput = pipe
      task.standardError = pipe

      do {
        try task.run()
      } catch {
        // handle errors
        print("Error: \(error.localizedDescription)")
      }

      let data = pipe.fileHandleForReading.readDataToEndOfFile()
      let output = String(data: data, encoding: .utf8)

      task.waitUntilExit()
      return (output, task.terminationStatus)
    }
}
