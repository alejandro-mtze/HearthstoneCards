//
//  SelectedCardView.swift
//  Hearthstone Cards
//
//  Created by Blue Parrot Software Mac 01 on 5/3/21.
//

import SwiftUI
import URLImage

struct SelectedCardView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @ObservedObject var favoriteView = prueba()
    
    let card: Card
    
    
    var body: some View {
        
        ZStack {
            VStack {
                URLImage(url: URL(string: card.imgCard)!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250, alignment: .center)
                }
                
                
                Button(action: {
                    favoriteView.encodeData(card)
                    //Favorite(card)
                }) {
                    Text ("Favorite ❤️")
                }
                
                if card.textCard != "" {
                    Text(card.textCard)
                }
                Text("Type: " + card.type)
                if card.rarityCard != "" {
                    Text("Rarity: " + card.rarityCard)
                }
                Text("Set: " + card.cardSet)
                if card.costCard != "" {
                    Text("Cost: " + card.costCard)
                }
                Text("Class: " + card.playerClass)

            }
        }
        .navigationBarTitle(card.name)
    }
}

struct SelectedCardView_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCardView(card: Card(cardId: "", name: "", cardSet: "", type: "", faction: "", rarity: "", playerClass: "", img: "", text: "", cost: 0))
    }
}


