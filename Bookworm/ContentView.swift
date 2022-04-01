//
//  ContentView.swift
//  Bookworm
//
//  Created by Garret Poole on 3/31/22.
//

import SwiftUI
struct PushButton: View{
    let title: String
    //@State changes internal state but wont reflect change in ContentView
    //@Binding fixes that so "On" of "Off" will now change
    @Binding var isOn: Bool
    
    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View{
        Button(title){
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(colors: isOn ? onColors: offColors, startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}


struct ContentView: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack{
            PushButton(title: "Remeber Me", isOn: $rememberMe)
            Text(rememberMe ? "On" : "Off")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
