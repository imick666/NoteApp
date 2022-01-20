//
//  Note.swift
//  NoteApp (iOS)
//
//  Created by Mickael Ruzel on 19/01/2022.
//

import Foundation

class Note: Identifiable, ObservableObject {
    var id = UUID().uuidString
    var note: String
    var date: Date
    var cardColor: String
    
    init(note: String, date: Date, cardColor: String) {
        self.note = note
        self.date = date
        self.cardColor = cardColor
    }
    
}

func getSampleDate(offset: Int) -> Date {
    let calendar = Calendar.current
    
    let date  = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var preview_notes: [Note] {
    [
        Note(note: "The beginning of screenless design UI jobs to be taken ...", date: getSampleDate(offset: 1), cardColor: "Skin"),
        Note(note: "13 things you should give up if you want to be a successful UX designer", date: getSampleDate(offset: -10), cardColor: "Purple"),
        Note(note: "The psychology principles every UI/UX designer needs to know", date: getSampleDate(offset: -15), cardColor: "Green"),
        Note(note: "52 research terms you need to know as a UX designer", date: getSampleDate(offset: 10), cardColor: "Blue"),
        Note(note: "10 UI & UX lessons from defigning my own product", date: getSampleDate(offset: -3), cardColor: "Orange"),
    ]
}
