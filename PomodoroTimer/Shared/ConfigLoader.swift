//
//  ConfigLoader.swift
//  PomodoroTimer
//
//  Created by An Nguyen on 2023/02/19.
//

import Foundation

class ConfigLoader {
    static let ConfigName = "Config.plist"

    static func parseFile(named fileName: String = ConfigName) -> Configuration {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: nil),
            let fileData = FileManager.default.contents(atPath: filePath)
        else {
            fatalError("Config file '\(fileName)' not loadable!")
        }

        do {
            let config = try PropertyListDecoder().decode(Configuration.self, from: fileData)
            return config
        } catch {
            fatalError("Configuration not decodable from '\(fileName)': \(error)")
        }
    }
}

struct Configuration: Decodable {
    
    enum Environment: String {
        case develop
        case staging
        case production
    }
    
    let config: String
    
    var environment: Environment {
        guard let environment = Environment(rawValue: config) else {
            fatalError("Invalid config: \(config)")
        }
        
        return environment
    }
    
}

let config = ConfigLoader.parseFile()
