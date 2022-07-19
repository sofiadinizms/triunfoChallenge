//
//  Movie+API.swift
//  FilmADA
//
//  Created by Francisco Soares Neto on 13/07/22.
//

import Foundation

extension Movie {
    
    static let urlComponents = URLComponents(string: "https://api.themoviedb.org/")!
    
    static func popularMoviesAPI() async -> [Movie]{
        
        var components = Movie.urlComponents
        
        components.path = "/3/movie/popular"
        components.queryItems = [
            URLQueryItem.init(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do{
            let (data, response) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let movieResult = try decoder.decode(MovieResponse.self, from: data)
            return movieResult.results
        } catch{
            print(error)
        }
        
        return []
    }
    
    static func nowPlayingAPI() async -> [Movie]{
        var components = Movie.urlComponents
        
        components.path = "/3/movie/now_playing"
        components.queryItems = [
            URLQueryItem.init(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do{
            let (data, response) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let nowPlayingResult = try decoder.decode(MovieResponse.self, from: data)
            return nowPlayingResult.results
        } catch{
            print(error)
        }
        
        return []
    }
    
    static func upcomingAPI() async -> [Movie]{
        var components = Movie.urlComponents
        
        components.path = "/3/movie/upcoming"
        components.queryItems = [
            URLQueryItem.init(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do{
            let (data, response) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let upcomingResults = try decoder.decode(MovieResponse.self, from: data)
            return upcomingResults.results
        } catch {
            print(error)
        }
        
        return []
    }
    
    static func trendingAPI(period: String) async -> [Movie]{
        var components = Movie.urlComponents
        
        components.path = "/3/trending/movie/\(period)"
        components.queryItems = [
            URLQueryItem.init(name: "api_key", value: Movie.apiKey)
        ]
        
        let session = URLSession.shared
        
        do{
            let (data, response) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let trendingResults = try decoder.decode(MovieResponse.self, from: data)
            
            return trendingResults.results
        } catch{
            print(error)
        }
        
        return []
    }
    
    static func searchAPI(title:String) async -> [Movie]{
        var components = Movie.urlComponents
        
        components.path = "/3/search/movie"
        components.queryItems = [
            URLQueryItem.init(name: "api_key", value: Movie.apiKey),
            URLQueryItem(name: "query", value: title)
        ]
        
        let session = URLSession.shared
        
        do{
            let (data, response) = try await session.data(from: components.url!)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            let searchResult = try decoder.decode(MovieResponse.self, from: data)
            
            return searchResult.results
        } catch{
            print(error)
        }
        
        return []
    }
    
    
    
    //MARK: - Download de imagem
    static func downloadImageData(withPath: String) async  -> Data{
        
        let urlString = "https://image.tmdb.org/t/p/w780\(withPath)"
        let url: URL = URL(string: urlString)!
        
        
        let session = URLSession.shared
        session.configuration.requestCachePolicy = .returnCacheDataElseLoad
        do{
            let (imageData, response) = try await session.data(from: url)
            return imageData
        } catch{
            print(error)
        }
        
        return Data()
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

