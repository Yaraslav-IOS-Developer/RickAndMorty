//
//  CharactersFactory.swift
//  RickAndMorty
//
//  Created by Yaroslav on 13.09.23.
//

import UIKit

protocol CharactersFactory {
  func makeModule(coordinator: CharacterViewControllerCoordinator) -> UIViewController
}

struct CharactersFactoryImp: CharactersFactory {
  func makeModule(coordinator: CharacterViewControllerCoordinator) -> UIViewController {
    let controller = CharactersViewController()
    controller.title = "Character"
    return controller
  }
}
