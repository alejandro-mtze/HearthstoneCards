//
//  CardData.swift
//  Hearthstone Cards
//
//  Created by Blue Parrot Software Mac 01 on 5/5/21.
//

import Foundation

struct Card: Codable, Identifiable {
    var id: String { cardId == nil ? "" : cardId! }
    var factionCard: String { faction == nil ? "" : faction! }
    var rarityCard: String { rarity == nil ? "" : rarity! }
    var imgCard: String { img == nil ? "https://kabik.mx/assets/not_found_image.png" : img! }
    var textCard: String { text == nil ? "" : text! }
    var costCard: String { cost == nil ? "" : ("\(cost!)") }
    
    
    let cardId: String?
    let name: String
    let cardSet: String
    let type: String
    let faction: String?
    let rarity: String?
    let playerClass: String
    let img: String?
    let text: String?
    let cost: Int?
    
}
