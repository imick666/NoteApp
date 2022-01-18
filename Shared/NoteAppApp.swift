//
//  NoteAppApp.swift
//  Shared
//
//  Created by Mickael Ruzel on 18/01/2022.
//

import SwiftUI

@main
struct NoteAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
