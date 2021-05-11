//
//  Favorite.swift
//  Hearthstone Cards
//
//  Created by Blue Parrot Software Mac 01 on 5/9/21.
//

import Foundation

var favorites = [Card]()
var decodeFavorites = [Card]()
var loadedFavorites = [Card]()


class prueba: ObservableObject {
    
    @Published var favoriteCards = [Card]()
    
    func encodeData (_ favoriteCard: Card) {
        let defaults = UserDefaults.standard
        
        var id: [String] = defaults.stringArray(forKey: "idFavCard") ?? []
        var name: [String] = defaults.stringArray(forKey: "nameFavCard") ?? []
        var cardSet: [String] = defaults.stringArray(forKey: "cardSetFavCard") ?? []
        var type: [String] = defaults.stringArray(forKey: "typeFavCard") ?? []
        var factionCard: [String] = defaults.stringArray(forKey: "factionFavCard") ?? []
        var rarityCard: [String] = defaults.stringArray(forKey: "rarityFavCard") ?? []
        var playerClass: [String] = defaults.stringArray(forKey: "classFavCard") ?? []
        var imgCard: [String] = defaults.stringArray(forKey: "imgFavCard") ?? []
        var textCard: [String] = defaults.stringArray(forKey: "textFavCard") ?? []
        var costCard: [String] = defaults.stringArray(forKey: "costFavCard") ?? []
        
        let index = searchFav(favoriteCard.id, id)
        
        if index >= 0 {
            
            id.remove(at: index)
            name.remove(at: index)
            cardSet.remove(at: index)
            type.remove(at: index)
            factionCard.remove(at: index)
            rarityCard.remove(at: index)
            playerClass.remove(at: index)
            imgCard.remove(at: index)
            textCard.remove(at: index)
            costCard.remove(at: index)
            
        }else {
            
            id.append(favoriteCard.id)
            name.append(favoriteCard.name)
            cardSet.append(favoriteCard.cardSet)
            type.append(favoriteCard.type)
            factionCard.append(favoriteCard.factionCard)
            rarityCard.append(favoriteCard.rarityCard)
            playerClass.append(favoriteCard.playerClass)
            imgCard.append(favoriteCard.imgCard)
            textCard.append(favoriteCard.textCard)
            costCard.append(favoriteCard.costCard)
            
        }
        
        defaults.set(id, forKey: "idFavCard")
        defaults.set(name, forKey: "nameFavCard")
        defaults.set(cardSet, forKey: "cardSetFavCard")
        defaults.set(type, forKey: "typeFavCard")
        defaults.set(factionCard, forKey: "factionFavCard")
        defaults.set(rarityCard, forKey: "rarityFavCard")
        defaults.set(playerClass, forKey: "classFavCard")
        defaults.set(imgCard, forKey: "imgFavCard")
        defaults.set(textCard, forKey: "textFavCard")
        defaults.set(costCard, forKey: "costFavCard")
    }
    
    func decodeData () {
        
        let defaults = UserDefaults.standard
        
        let id: [String] = defaults.stringArray(forKey: "idFavCard") ?? []
        let name: [String] = defaults.stringArray(forKey: "nameFavCard") ?? []
        let cardSet: [String] = defaults.stringArray(forKey: "cardSetFavCard") ?? []
        let type: [String] = defaults.stringArray(forKey: "typeFavCard") ?? []
        let factionCard: [String] = defaults.stringArray(forKey: "factionFavCard") ?? []
        let rarityCard: [String] = defaults.stringArray(forKey: "rarityFavCard") ?? []
        let playerClass: [String] = defaults.stringArray(forKey: "classFavCard") ?? []
        let imgCard: [String] = defaults.stringArray(forKey: "imgFavCard") ?? []
        let textCard: [String] = defaults.stringArray(forKey: "textFavCard") ?? []
        let costCard: [String] = defaults.stringArray(forKey: "costFavCard") ?? []
        
        favoriteCards.removeAll()
        
        let i = id.count
        var index = 0
        
        while i > index {
            
            favoriteCards.append(Card(cardId: id[index], name: name[index], cardSet: cardSet[index], type: type[index], faction: factionCard[index], rarity: rarityCard[index], playerClass: playerClass[index], img: imgCard[index], text: textCard[index], cost: Int(costCard[index])))
            
            index += 1
            
        }
    }
}

func searchFav(_ id: String, _ idArr: [String]) -> Int {
    for (index, item) in idArr.enumerated() {
        if item == id {
            return index
        }
    }
    
    
    return -1
}
