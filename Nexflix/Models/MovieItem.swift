//
//  MovieItem.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 18.01.2023.
//

import UIKit

struct Movie: Codable {
    let titles: [Title]

    enum CodingKeys: String, CodingKey {
        case titles = "titles"
    }
}

// MARK: - Title
struct Title: Codable {
    let jawSummary: JawSummary

    enum CodingKeys: String, CodingKey {
        case jawSummary = "jawSummary"
    }
}

// MARK: - JawSummary
struct JawSummary: Codable {
    let title: String
    let logoImage: LogoImage
    let backgroundImage: BackgroundImage
    let description: String?
    let releaseYear: Int?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case logoImage = "logoImage"
        case backgroundImage = "backgroundImage"
        case description = "synopsis"
        case releaseYear = "releaseYear"
    }
}

// MARK: - BackgroundImage
struct BackgroundImage: Codable {
    let url: String

    enum CodingKeys: String, CodingKey {
        case url = "url"
    }
}

// MARK: - LogoImage
struct LogoImage: Codable {
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
    }
}
