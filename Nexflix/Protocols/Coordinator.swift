//
//  Coordinator.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//

import UIKit

/// Coordinator interface, responsible for navigation throught the application
protocol Coordinator {
    /// associated type it's like good approach to use it in different ways like enums, generics, typealias and so on
    associatedtype Path
    /// here is the best way how you can communicate through your coordinator and make different behaviour
    func navigate(to step: Path)
}



