//
//  ContentView.swift
//  Bookworm
//
//  Created by Garret Poole on 3/31/22.
//

import SwiftUI


struct ContentView: View {
    //make new fetchr equest with no sorting (random order) and put into propery with type FetchedTesults<Student>
    //looks in environment for managedObjectContext (in BookwormApp.swift) and uses that for loading and saving
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack{
            List(students) { student in
                //Core Data cares only that properties have values whens saved
                //Saving checks if it has value and if not refuses to save so nil coalescing required
                Text(student.name ?? "Unknown")
            }
            
            Button("Add"){
                let firstnames = ["Ginny", "Harry", "Ron", "Hermione", "Luna"]
                let lastnames = ["Granger", "Potter", "Weasely", "Lovegood"]
                
                let chosenFirstName = firstnames.randomElement()!
                let chosenLastName = lastnames.randomElement()!
                
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(chosenFirstName) \(chosenLastName)"
                //saves to permanent storage
                try? moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
