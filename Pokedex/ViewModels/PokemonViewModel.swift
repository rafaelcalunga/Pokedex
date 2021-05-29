//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Rafael Calunga on 2021-05-29.
//

import Foundation

class PokemonViewModel: ObservableObject {
    
    //MARK: - Properties
    
    @Published var pokemons = [Pokemon]()
    
    private let WEBAPI_URL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    //MARK: - Methods
    
    init() {
        fetchPokemons()
    }
    
    func fetchPokemons() {
        
        guard let url = URL(string: WEBAPI_URL) else { return }
        
        var pokemons = [Pokemon]()
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.removeOccurrences(of: "null,") else { return }
            //guard let data = data else { return }
            //guard let pokemons = try JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            do {
                pokemons = try JSONDecoder().decode([Pokemon].self, from: data)
            } catch {
                print("Error (fetchPokemons): \(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                self.pokemons = pokemons
            }
        }.resume()
    }
}

extension Data {
    func removeOccurrences(of string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
