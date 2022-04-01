//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Garret Poole on 3/31/22.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                //live versions of data
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
