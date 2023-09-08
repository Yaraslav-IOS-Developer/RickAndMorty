//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Yaroslav on 8.09.23.
//

import UIKit

protocol Coordinator {
  var navigation: UINavigationController { get }
  func start()
}
