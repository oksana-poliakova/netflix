//
//  Element.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 18.01.2023.
//

import Foundation

// MARK: - WelcomeElement
struct WelcomeElement: Codable {
    let titleID: String?
    let details: Details?

    enum CodingKeys: String, CodingKey {
        case titleID = "titleId"
        case details
    }
}

// MARK: - Details
struct Details: Codable {
    let genres: [Cast]?
    let id: Int?
    let type: String?
    let videoID: Int?
    let requestID, userRatingRequestID, title: String?
    let releaseYear: Int?
    let episodeCount: Int?
    let episodeTitle: String?
    let logoImage: LogoImage?
    let backgroundImage: BackgroundImage?

    enum CodingKeys: String, CodingKey {
        case videoID = "videoId"
        case requestID = "requestId"
    }
}

// MARK: - Cast
struct Cast: Codable {
    let id: Int?
    let name: String?
}

// MARK: - LogoImage
struct LogoImage: Codable {
    let videoID: Int?
    let url: String?
    let type: String?
    let width, height: Int?
    let logoImageExtension, size, imageKey: String?

    enum CodingKeys: String, CodingKey {
        case videoID = "videoId"
        case url, type, width, height
        case logoImageExtension = "extension"
        case size, imageKey
    }
}

// MARK: - BackgroundImage
struct BackgroundImage: Codable {
    let videoID: Int?
    let url: String?
    let width, height: Int?
    let backgroundImageExtension: String?
    let size: Int?
    let focalPoint, imageKey: String?

    enum CodingKeys: String, CodingKey {
        case videoID = "videoId"
        case url, width, height
        case backgroundImageExtension = "extension"
        case size, focalPoint, imageKey
    }
}
