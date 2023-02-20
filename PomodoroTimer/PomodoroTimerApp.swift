//
//  PomodoroTimerApp.swift
//  PomodoroTimer
//
//  Created by An Nguyen on 2023/02/19.
//

import SwiftUI

@main
struct PomodoroTimerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear(perform: validateConfig)
        }
    }
    
    func validateConfig() {
        /// Because `Config.plist` is being loaded at runtime, an invalid file will cause a crash
        /// therefore we want this crash to occur as soon as possible by running it at the start of the app
        _ = config.environment
    }
}
