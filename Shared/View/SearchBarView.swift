//
//  SearchBarView.swift
//  NoteApp (iOS)
//
//  Created by Mickael Ruzel on 20/01/2022.
//

import SwiftUI

struct SearchBarView: View {
    
    @State private var text = ""
    
    var body: some View {
        // Search Bar
        
        VStack(spacing: 0) {
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                TextField("Search", text: $text)
            }
            .padding(.bottom)
            
            Divider()
                .frame(maxWidth: .infinity, maxHeight: 1)
                .padding(.horizontal, -16)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
