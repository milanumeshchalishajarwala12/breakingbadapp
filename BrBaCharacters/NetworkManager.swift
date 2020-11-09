//
//  NetworkManager.swift
//  BrBaCharacters
//
//  Created by Milan Chalishajarwala on 10/13/20.
//

import Foundation


class NetworkManager{
    typealias completionHandler = (([CharacterModel]) -> ())
    var closure: completionHandler?
    static let shared = NetworkManager()
    private init () {}
    
    
    func fetchCharacter<T: Codable>(type: T.Type){
    let endpoint = "https://www.breakingbadapi.com/api/characters"
    
        let url = URL(string: endpoint)
        
        guard let dataUrl = url else { return }
        
        
        URLSession.shared.dataTask(with: dataUrl){
            (data, response, error) in
            do {
                if let data = data{
                let jsonData = try JSONDecoder().decode([T].self, from: data)
                    guard let completionBlock = self.closure else { return }
                    completionBlock(jsonData as! [CharacterModel])
                }
            }catch {
                print("ERROR: \(error.localizedDescription)")
            }
            
        }.resume()
    }
  
}
