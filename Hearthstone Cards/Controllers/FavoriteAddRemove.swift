//
//  favoriteAddRemove.swift
//  Hearthstone Cards
//
//  Created by Blue Parrot Software Mac 01 on 5/11/21.
//

import Foundation

func FavoriteAddRemove(_ id: String) -> Bool {
    
    let defaults = UserDefaults.standard
    let idCard: [String] = defaults.stringArray(forKey: "idFavCard") ?? []
    
    for item in idCard {
        if id == item {
            return true
        }
    }
    
    return false
}
