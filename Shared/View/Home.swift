//
//  Home.swift
//  NoteApp
//
//  Created by Mickael Ruzel on 18/01/2022.
//

import SwiftUI

struct Home: View {
    
    // Showing crard color on button clicked
    @State private var showColors = false
    
    // Button animation
    @State private var animateButton = false
    
    var body: some View {
        HStack(spacing: 0) {
            
            // Side Bar...
            if isMacOS {
                Group {
                    sideBar
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 1)
                }
            }
            
            mainContent
        }
        .ignoresSafeArea()
        .frame(width: isMacOS ? screenSize.width / 1.7 : nil, height: isMacOS ? screenSize.height - 180 : nil, alignment: .leading)
        .background(Color("BG").ignoresSafeArea())
        .preferredColorScheme(.light)
    }
    
    @ViewBuilder
    private var mainContent: some View {
        VStack(spacing: 6) {
            
            // Search Bar
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                TextField("Search", text: .constant(""))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, isMacOS ? 0 : 10)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                Text("Notes")
                    .font(isMacOS ?
                            .system(size: 33, weight: .bold) :
                                .largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                let columns = Array(repeating: GridItem(.flexible(), spacing: isMacOS ? 25 : 15), count: isMacOS ? 3 : 1)
                
                LazyVGrid(columns: columns, spacing: 25) {
                    // Notes
                    ForEach(preview_notes) { note in
                        // Card View
                        CardView(note: note)
                        
                    }
                }
                .padding(.top, 30)
            }
            .padding(.top, isMacOS ? 45 : 30)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.top, isMacOS ? 40 : 15)
        .padding(.horizontal, 25)
    }
    
    @ViewBuilder
    private func CardView(note: Note) -> some View {
        
        VStack {
            
            Text(note.note)
                .font(isMacOS ? .title2 : .body)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text(note.date, style: .date)
                    .foregroundColor(.black)
                    .opacity(0.8)
                
                Spacer(minLength: 0)
                
                // Edit Button
                
                Button {
                    
                } label: {
                    Image(systemName: "pencil")
                        .font(.system(size: 12, weight: .bold))
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black)
                        .clipShape(Circle())
                }
                
            }
            .padding(.top, 55)
        }
        .padding()
        .background(Color(note.cardColor))
        .cornerRadius(18)
    }
    
    @ViewBuilder
    private var sideBar: some View {
        VStack {
            Text("Pocket")
                .font(.title2)
                .fontWeight(.semibold)
            
            // Add button
            addButton
                .zIndex(1)
            
            VStack(spacing: 15) {
                let colors = [
                    Color("Skin"),
                    Color("Orange"),
                    Color("Purple"),
                    Color("Blue"),
                    Color("Green")
                ]
                
                ForEach(colors, id: \.self) { color in
                    Circle()
                        .fill(color)
                        .frame(width: 20, height: 20)
                }
            }
            .padding(.top, 20)
            .frame(height: showColors ? nil : 0)
            .opacity(showColors ? 1 : 0)
            .zIndex(0)
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding(.vertical)
        .padding(.horizontal, 22)
        .padding(.top, 35)
    }
    
    @ViewBuilder
    private var addButton: some View {
        Button {
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                showColors.toggle()
                animateButton.toggle()
            }
            
            // resetting the button
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation(.spring()) {
                    animateButton.toggle()
                    showColors.toggle()
                }
            }
        } label: {
            Image(systemName: "plus")
                .font(.title2)
                .foregroundColor(.white)
                .scaleEffect(animateButton ? 1.1 : 1)
                .padding(isMacOS ? 12 : 15)
                .background(Color.black)
                .clipShape(Circle())
        }
        .rotationEffect(.degrees(showColors ? 45 : 0))
        .scaleEffect(animateButton ? 1.1 : 1)
        .padding(.top, 30)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
