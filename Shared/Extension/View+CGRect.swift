//
//  View+CGRect.swift
//  NoteApp
//
//  Created by Mickael Ruzel on 18/01/2022.
//

import Foundation
import SwiftUI

extension View {
    
    /// Visible screen frame for iOS and MacOS
    var screenSize: CGRect {
        #if os(iOS)
        return UIScreen.main.bounds
        #else
        return NSScreen.main!.visibleFrame
        #endif
    }
}
