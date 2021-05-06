//
//  ClassView.swift
//  Hearthstone Cards
//
//  Created by Blue Parrot Software Mac 01 on 5/3/21.
//

import SwiftUI

struct ClassView: View {
    
    let Classes: String?
    
    @ObservedObject var networkManager = NetworkManager()
    
    
    
    var body: some View {
        
        
        List(networkManager.cards){ card in
            NavigationLink(destination: SelectedCardView()){
                HStack {
                    Image("notfound")
                    
                    VStack {
                        Text(card.name)
                            .fontWeight(.heavy)
                        Text(card.type)
                        Text(card.rarityCard)
                        Text(card.cardSet)
                    }
                }
            }
            
            
        }
        .navigationBarTitle(Classes!)
        
        .onAppear {
            networkManager.fetchData(Classes!)
        }
        
    }
}

struct ClassView_Previews: PreviewProvider {
    static var previews: some View {
        ClassView(Classes: "")
    }
}


