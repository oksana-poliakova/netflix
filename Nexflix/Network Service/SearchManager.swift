//
//  SearchManager.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 27.01.2023.
//

import Foundation


final class SearchManager: NetworkManager {
    
    // MARK: - Properties
    
    private var baseURLComponent = URLComponents(string: "https://netflix54.p.rapidapi.com/search/")
    private let apiKey = "6b3e1fdf79msh0c30631baa1086dp1340d4jsn9cc5a8a84a20"
    private var headers: [String: String] = [
        "X-RapidAPI-Key": "6b3e1fdf79msh0c30631baa1086dp1340d4jsn9cc5a8a84a20",
        "X-RapidAPI-Host": "netflix54.p.rapidapi.com"
    ]
    
    enum Error: Swift.Error {
        case badStatusCode
        case badURL
    }
    
    // MARK: - Init
    
    init(query: String) {
        baseURLComponent?.queryItems = [URLQueryItem(name: "query", value: query)]
    }
    
    // MARK: - Fetch data
    
    func fetch(completionBlock: @escaping NetworkManager.Result) {
        guard
            let baseURLString = baseURLComponent?.url?.absoluteString,
            let url = URL(string: baseURLString)
        else {
            completionBlock(.failure(Error.badURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        urlRequest.allHTTPHeaderFields = headers
        
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard
                let response = response as? HTTPURLResponse,
                response.isSuccess
            else {
                completionBlock(.failure(Error.badStatusCode))
                return
            }
            
            if let data = data {
                DispatchQueue.main.async {
                    completionBlock(.success(data))
                }
            } else if let error = error {
                DispatchQueue.main.async {
                    completionBlock(.failure(error))
                }
            }
        }.resume()
    }
}
