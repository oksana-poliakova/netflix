//
//  Coordinator.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}



