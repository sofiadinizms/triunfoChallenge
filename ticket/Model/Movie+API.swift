//
//  Movie+API.swift
//  FilmADA
//
//  Created by Francisco Soares Neto on 13/07/22.
//

import Foundation

extension Movie {
    
    static let urlComponents = URLComponents(string: "https://api.themoviedb.org/3/")!
    
    static func popularMoviesAPI() async -> [Movie]{
        
        var components = Movie.urlComponents
        
        components.path = "/movie/popular"
        components.queryItems = [
            URLQueryItem.init(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do{
            let (data, response) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let movieResult = try decoder.decode(MovieResponse.self, from: data)
        } catch{
            print(error)
        }
        
        
        
        
        
        return []
    }

    // MARK: - Recuperando a chave da API de um arquivo
    static var apiKey: String {
        guard let url = Bundle.main.url(forResource: "TMDB-Info", withExtension: "plist") else {
            fatalError("Couldn't find api key configuration file.")
        }
        guard let plist = try? NSDictionary(contentsOf: url, error: ()) else {
            fatalError("Couldn't interpret api key configuration file as plist.")
        }
        guard let key = plist["API_KEY"] as? String else {
            fatalError("Couldn't find an api key in its configuration file.")
        }
        return key
    }
}

