//
//  ContentView.swift
//  Hearthstone Cards
//
//  Created by Blue Parrot Software Mac 01 on 5/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    @ObservedObject var favoriteView = prueba()
    
    @State private var search: String = ""
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView {
            
            ZStack {
                VStack {
                    Image("Hearthstone-Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        //.padding()
                        .frame(width: 300, height: 300)
                        //.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
                    NavigationLink(destination: FavoriteView()){
                        Text("Favorite Cards ❤️")
                    }

                    
                    
                    TextField("Search", text: $search)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .autocapitalization(.words)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            self.hideKeyboard()
                        }
                    NavigationLink(destination: SearchView(search: search), tag: 1, selection: $selection) {
                        Button("Done!") {
                            self.hideKeyboard()
                            self.selection = 1
                           
                        }
                    }
                    
                    
                    HStack{
                        NavigationLink(destination: ClassView(classes: "Demon Hunter")) {
                            ClassImage(classCard: "Demon-Hunter")
                        }
                        
                        NavigationLink(destination: ClassView(classes: "Druid")) {
                            ClassImage(classCard: "Druid")
                        }
                        
                        
                        NavigationLink(destination: ClassView(classes: "Hunter")) {
                            ClassImage(classCard: "Hunter")
                        }
                        
                        NavigationLink(destination: ClassView(classes: "Mage")) {
                            ClassImage(classCard: "Mage")
                        }
                    }
                    HStack{
                        NavigationLink(destination: ClassView(classes: "Paladin")) {
                            ClassImage(classCard: "Paladin")
                        }
                        
                        NavigationLink(destination: ClassView(classes: "Priest")) {
                            ClassImage(classCard: "Priest")
                        }
                        
                        
                        NavigationLink(destination: ClassView(classes: "Rogue")) {
                            ClassImage(classCard: "Rogue")
                        }
                        
                        NavigationLink(destination: ClassView(classes: "Shaman")) {
                            ClassImage(classCard: "Shaman")
                        }
                    }
                    HStack{
                        NavigationLink(destination: ClassView(classes: "Warlock")) {
                            ClassImage(classCard: "Warlock")
                        }
                        
                        NavigationLink(destination: ClassView(classes: "Warrior")) {
                            ClassImage(classCard: "Warrior")
                        }
                        NavigationLink(destination: ClassView(classes: "Neutral")) {
                            ClassImage(classCard: "Neutral")
                        }
                    }
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ClassImage: View {
    let classCard: String
    
    var body: some View {
        Image(classCard)
            .resizable()
            .aspectRatio(contentMode: .fit)
            //.clipShape(Capsule())
            .cornerRadius(10.0)
    }
}
