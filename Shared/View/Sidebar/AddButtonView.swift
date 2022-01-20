//
//  AddButtonView.swift
//  NoteApp (iOS)
//
//  Created by Mickael Ruzel on 20/01/2022.
//

import SwiftUI

struct AddButtonView: View {
    
    @Binding var showColors: Bool
    @State var animateButton = false
    
    var body: some View {
        VStack {
            if isMacOS {
                plusButton
                    .zIndex(1)
            }
            
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
                        .frame(width: isMacOS ? 20 : 25,
                               height: isMacOS ? 20 : 25)
                }
            }
            .padding(.top, 20)
            .frame(height: showColors ? nil : 0)
            .opacity(showColors ? 1 : 0)
            .zIndex(0)
            
            if !isMacOS {
                plusButton
                    .zIndex(1)
                
            }
            
        }
    }
    
    private var plusButton: some View {
        Button {
            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.6)) {
                showColors.toggle()
                animateButton.toggle()
            }
            
            // resetting the button
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                if showColors {
                    withAnimation(.spring()) {
                        animateButton.toggle()
                        showColors.toggle()
                    }
                    
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

struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView(showColors: .constant(false))
    }
}
