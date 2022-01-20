//
//  MainContentView.swift
//  NoteApp (iOS)
//
//  Created by Mickael Ruzel on 20/01/2022.
//

import SwiftUI

struct NoteListView: View {
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            Text("Notes")
                .font(isMacOS ?
                        .system(size: 33, weight: .bold) :
                            .largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            let columns = Array(repeating: GridItem(.flexible(), spacing: isMacOS ? 25 : 15), count: isMacOS ? 3 : 1)
            
            LazyVGrid(columns: columns, spacing: 25) {
                // Notes
                ForEach(preview_notes) { note in
                    // Card View
                    CardView(note: note)
                }
            }
            
            if !isMacOS {
                Spacer(minLength: 90)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.horizontal, 25)
    }
}

struct MainContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        
    }
}
