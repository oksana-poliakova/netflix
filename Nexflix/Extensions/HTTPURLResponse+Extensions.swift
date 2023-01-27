//
//  HTTPURLResponse+Extensions.swift
//  CodableTest
//
//  Created by Oksana Poliakova on 23.01.2023.
//

import Foundation

extension HTTPURLResponse {
    /// Informational - Request received, continuing process.
    var isInformational: Bool {
        return (100...199).contains(statusCode)
    }
    /// Success - The action was successfully received, understood, and accepted.
    var isSuccess: Bool {
        return (200...299).contains(statusCode)
    }
    /// Redirection - Further action must be taken in order to complete the request.
    var isRedirection: Bool {
        return (300...399).contains(statusCode)
    }
    /// Client Error - The request contains bad syntax or cannot be fulfilled.
    var isClientError: Bool {
        return (400...499).contains(statusCode)
    }
    /// Server Error - The server failed to fulfill an apparently valid request.
    var isServerError: Bool {
        return (500...599).contains(statusCode)
    }
}



