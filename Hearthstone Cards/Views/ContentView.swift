//
//  ContentView.swift
//  Hearthstone Cards
//
//  Created by Blue Parrot Software Mac 01 on 5/3/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            
            ZStack {
                VStack {
                    Image("Hearthstone-Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    Text("Hello, world!")
                        .padding()
                    Divider()
                    TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: .constant(""))
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
                    Button("Done!") {
                        self.hideKeyboard()
                       
                    }
                    Divider()
                    HStack{
                        NavigationLink(destination: ClassView(Classes: "Druid")) {
                            Image("Hearthstone-Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        
                        
                        NavigationLink(destination: ClassView(Classes: "Mage")) {
                            Image("Hearthstone-Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                    }
                    HStack{
                        NavigationLink(destination: ClassView(Classes: "Paladin")) {
                            Image("Hearthstone-Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        }
                        NavigationLink(destination: ClassView(Classes: "Hunter")) {
                            Image("Hearthstone-Logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
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
