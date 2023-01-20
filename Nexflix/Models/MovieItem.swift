//
//  MovieItem.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 18.01.2023.
//

import UIKit

// MARK: - Movie item model

struct MovieItem: Codable {
    let title: String?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case image = "image"
    }
}
