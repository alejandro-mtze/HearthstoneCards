//
//  CardData.swift
//  Hearthstone Cards
//
//  Created by Blue Parrot Software Mac 01 on 5/5/21.
//

import Foundation

struct Card: Decodable, Identifiable {
    var id: String { cardId == nil ? "" : cardId! }
    var factionCard: String { faction == nil ? "" : faction! }
    var rarityCard: String { rarity == nil ? "" : rarity! }
    var imgCard: String { img == nil ? "" : img! }
    
    
    let cardId: String?
    let name: String
    let cardSet: String
    let type: String
    let faction: String?
    let rarity: String?
    let playerClass: String
    let img: String?
    
    
}
