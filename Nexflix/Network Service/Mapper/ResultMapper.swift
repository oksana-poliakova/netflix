//
//  ResultMapper.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 27.01.2023.
//

import Foundation

final class ResultMapper {
    static func map<T: Decodable>(model: T.Type,_ data: Data) -> T? {
        guard let root = try? JSONDecoder().decode(model, from: data) else {
            return nil
        }
        
        return root
    }
}
