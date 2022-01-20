//
//  SidebarView.swift
//  NoteApp (iOS)
//
//  Created by Mickael Ruzel on 20/01/2022.
//

import SwiftUI

struct SidebarView<Content: View>: View {
    
    @State private var showColors = false
    @ViewBuilder var content: () -> Content
    
    var body: some View {
#if os(macOS)
        HStack(spacing: 0) {
            VStack {
                
                Text("Pocket")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                // Add button
                AddButtonView(showColors: $showColors)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.vertical)
            .padding(.horizontal, 22)
            .padding(.top, 35)
            
            Rectangle()
                .fill(Color.gray.opacity(0.15))
                .frame(width: 1)
            
            content()
        }
#else
        ZStack {
            
            content()
            
            AddButtonView(showColors: $showColors)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding()
                .background(BlurView(style: .systemUltraThinMaterialDark)
                                .opacity(showColors ? 1 : 0)
                                .ignoresSafeArea())
        }
#endif
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView {
            Text("Bonjour")
        }
        
    }
}
