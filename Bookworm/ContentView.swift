//
//  ContentView.swift
//  Bookworm
//
//  Created by Garret Poole on 3/31/22.
//

import SwiftUI

struct ContentView: View {
    //App Storage backed by user defaults
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView{
            //use within a NavView or Form to keep editor in bounds
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
