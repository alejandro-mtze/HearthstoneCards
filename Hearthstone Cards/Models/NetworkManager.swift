//
//  NetworkManager.swift
//  Hearthstone Cards
//
//  Created by Blue Parrot Software Mac 01 on 5/4/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    let basicURL = "https://omgvamp-hearthstone-v1.p.rapidapi.com/cards"
    let key = "c7b45677c1msh9a150469025c5acp13efc9jsn796154dd5d96"

    @Published var cards = [Card]()
    
    var card = Card(cardId: "", name: "", cardSet: "", type: "", faction: "", rarity: "", playerClass: "", img: "", text: "", cost: 0)

    func fetchData(_ Class: String) {

        let newClass = Class.replacingOccurrences(of: " ", with: "%20")
        let urlString = "\(basicURL)/classes/\(newClass)?collectible=1/&rapidapi-key=\(key)"
        
        performRequest(with: urlString)
        
    }
    
    func searchData(_ search: String) {
        
        let newSearch = search.replacingOccurrences(of: " ", with: "%20")
        
        let urlType = "/types/\(newSearch)?collectible=1&rapidapi-key=\(key)"
        let urlSet = "/sets/\(newSearch)?collectible=1&rapidapi-key=\(key)"
        let urlClass = "/classes/\(newSearch)?collectible=1&rapidapi-key=\(key)"
        let urlName = "/\(newSearch)?collectible=1&rapidapi-key=\(key)"
        
        
        performRequest(with: "\(basicURL)\(urlType)")
        performRequest(with: "\(basicURL)\(urlSet)")
        performRequest(with: "\(basicURL)\(urlClass)")
        performRequest(with: "\(basicURL)\(urlName)")
      
    }


    func performRequest (with urlString: String) {

        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode([Card].self, from: safeData)
                            DispatchQueue.main.async {
                                self.cards = results
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}




