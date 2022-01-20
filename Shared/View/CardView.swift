//
//  CardView.swift
//  NoteApp (iOS)
//
//  Created by Mickael Ruzel on 20/01/2022.
//

import SwiftUI

struct CardView: View {
    
    @ObservedObject var note: Note
    
    var body: some View {
        VStack {
            
            Text(note.note)
                .font(isMacOS ? .title2 : .body)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            Divider()
                .frame(maxHeight: 1)
                .padding(.horizontal, -25)
            
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
        }
        .frame(height: 150)
        .padding()
        .background(Color(note.cardColor))
        .cornerRadius(18)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let note = preview_notes[0]
        CardView(note: note)
    }
}
