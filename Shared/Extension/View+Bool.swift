//
//  View+Bool.swift
//  NoteApp
//
//  Created by Mickael Ruzel on 18/01/2022.
//

import Foundation
import SwiftUI

extension View {
    
    /// Get OS
    var isMacOS: Bool {
        #if os(iOS)
        return false
        #else
        return true
        #endif
    }
}
