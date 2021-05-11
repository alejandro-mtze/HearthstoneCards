//
//  FavoriteView.swift
//  Hearthstone Cards
//
//  Created by Blue Parrot Software Mac 01 on 5/3/21.
//

import SwiftUI
import URLImage

struct FavoriteView: View {
    
    @ObservedObject var favoriteView = prueba()
    
    var body: some View {
        
        List(favoriteView.favoriteCards){ card in
            NavigationLink(destination: SelectedCardView(card: card)) {
                HStack {
                    URLImage(url: URL(string: card.imgCard)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 150, height: 150, alignment: .center)
                        
                    }
                    
                    VStack(alignment: .leading) {
                        Text(card.name)
                            .fontWeight(.heavy)
                        Text(card.type)
                        Text(card.rarityCard)
                        Text(card.cardSet)
                        
                    }
                }
            }
        }
        .onAppear() {
            favoriteView.decodeData()
        }

        .navigationBarTitle("Favorite Cards ❤️")
        
    }
    
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
