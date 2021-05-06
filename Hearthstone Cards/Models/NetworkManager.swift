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

    func fetchData(_ Class: String) {
        let urlString = "\(basicURL)/classes/\(Class)?collectible=1/&rapidapi-key=\(key)"
        performRequest(with: urlString)
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




