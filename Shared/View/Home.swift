//
//  Home.swift
//  NoteApp
//
//  Created by Mickael Ruzel on 18/01/2022.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        SidebarView {
            VStack(spacing: 0) {
                SearchBarView()
                #if os(macOS)
                    .padding(.top)
                #endif
                NoteListView()
            }
            
        }
#if os(macOS)
        .ignoresSafeArea()
#endif
        .frame(width: isMacOS ? screenSize.width / 1.7 : nil, height: isMacOS ? screenSize.height - 180 : nil, alignment: .leading)
        .background(Color("BG").ignoresSafeArea())
        .preferredColorScheme(.light)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
