//
//  UIApplication.swift
//  EQuran
//
//  Created by Putra Pebriano Nurba on 04/05/24.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditingInput() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
