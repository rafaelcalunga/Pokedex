//
//  Pokemon.swift
//  Pokedex
//
//  Created by Rafael Calunga on 2021-05-29.
//

import Foundation
import SwiftUI

struct Pokemon: Decodable, Identifiable {
    
    //MARK: - Properties
    
    let id: Int
    let name: String
    let type: String
    let imageUrl: String
    
    var backgroundColor: Color {
        switch type {
        case "fire": return Color(.systemRed)
        case "poison": return Color(.systemGreen)
        case "water": return Color(.systemBlue)
        case "electric": return Color(.systemYellow)
        case "psychic": return Color(.systemPurple)
        case "normal": return Color(.systemOrange)
        case "ground": return Color(.systemGray)
        case "flying": return Color(.systemTeal)
        case "fairy": return Color(.systemPink)
        default: return Color(.systemIndigo)
        }
    }
    
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
