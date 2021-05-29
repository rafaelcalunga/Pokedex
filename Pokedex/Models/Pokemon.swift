//
//  Pokemon.swift
//  Pokedex
//
//  Created by Rafael Calunga on 2021-05-29.
//

import Foundation


/*struct PokemonType {
    
}*/

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let imageUrl: String
    
    // MARK: - Example
        
    static var example: Pokemon {
        Pokemon(
            id: Int.random(in: 1...100),
            name: "bulbasaur",
            type: "grass",
            imageUrl: "bulbasaur"
        )
    }
}
