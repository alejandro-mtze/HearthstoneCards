//
//  FavoriteView.swift
//  Hearthstone Cards
//
//  Created by Blue Parrot Software Mac 01 on 5/3/21.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        NavigationView {
            List() {
                HStack{
                    Image("notfound")
                    VStack{
                        Text("hola")
                            .fontWeight(.heavy)
                        Text("aaa")
                        Text("bbb")
                        Text("ccc")
                    }
                }
                
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
