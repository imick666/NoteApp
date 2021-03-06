//
//  ContentView.swift
//  Shared
//
//  Created by Mickael Ruzel on 18/01/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        
        Home()
            .buttonStyle(BorderlessButtonStyle())
            .textFieldStyle(PlainTextFieldStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
