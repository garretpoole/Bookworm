//
//  DataController.swift
//  Bookworm
//
//  Created by Garret Poole on 3/31/22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    //tells to use our Bookworm data model for its container
    //dont contain data just the model of the data
    let container = NSPersistentContainer(name: "Bookworm")
    //loads data from model
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
