//
//  MovieItem.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 18.01.2023.
//

import UIKit

// MARK: - MovieElement

struct MovieElement: Codable {
    let titleID: String?
    let details: Details?
    
    enum CodingKeys: String, CodingKey {
        case titleID = "titleId"
        case details = "details"
    }
}

// MARK: - Details

struct Details: Codable {
    let id: Int?
    let type: String?
    let title: String?
    let releaseYear: Int?
    let episodeCount: Int?
    let episodeTitle: String?
    let logoImage: LogoImage?
    let backgroundImage: BackgroundImage?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case title = "title"
        case releaseYear = "releaseYear"
        case episodeCount = "episodeCount"
        case episodeTitle = "episodeTitle"
        case logoImage = "logoImage"
        case backgroundImage = "backgroundImage"
    }
}

// MARK: - BackgroundImage
struct BackgroundImage: Codable {
    let videoID: Int?
    let url: String?
    let width: Int?
    let height: Int?
    let size: Int?
    let imageKey: String?

    enum CodingKeys: String, CodingKey {
        case videoID = "videoId"
        case url = "url"
        case width = "width"
        case height = "height"
        case size = "size"
        case imageKey = "imageKey"
    }
}

// MARK: - LogoImage
struct LogoImage: Codable {
    let videoID: Int?
    let url: String?
    let type: String?
    let width: Int?
    let height: Int?
    let size: String?
    let imageKey: String?

    enum CodingKeys: String, CodingKey {
        case videoID = "videoId"
        case url = "url"
        case type = "type"
        case width = "width"
        case height = "height"
        case size = "size"
        case imageKey = "imageKey"
    }
}
