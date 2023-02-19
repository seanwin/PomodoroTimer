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
        }
    }
}
