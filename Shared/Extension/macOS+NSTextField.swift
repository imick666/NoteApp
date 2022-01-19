//
//  NSTextField.swift
//  NoteApp
//
//  Created by Mickael Ruzel on 18/01/2022.
//

import Foundation

#if os(macOS)
extension NSTextField {
    open override var focusRingType: NSFocusRingType {
        get { .none }
        set { }
    }
}
#endif
