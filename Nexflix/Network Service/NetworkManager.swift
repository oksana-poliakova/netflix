//
//  NetworkManager.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 27.01.2023.
//

import Foundation

enum EndPoint {
    static let search = "search/"
    static let titleDetails = "title/details/"
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

protocol NetworkManager {
    typealias Result = (Swift.Result<Data, Error>) -> Void
    
    func fetch(completionBlock: @escaping Result)
}
