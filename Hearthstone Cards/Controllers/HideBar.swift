//
//  HideBar.swift
//  Hearthstone Cards
//
//  Created by Blue Parrot Software Mac 01 on 5/4/21.
//

import SwiftUI
import UIKit

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
