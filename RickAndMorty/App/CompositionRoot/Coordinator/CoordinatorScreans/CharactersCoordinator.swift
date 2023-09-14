//
//  CharactersCoordinator.swift
//  RickAndMorty
//
//  Created by Yaroslav on 13.09.23.
//

import UIKit

final class CharactersCoordinator: Coordinator {
  var navigation: UINavigationController
  private let characterFactory: CharactersFactory

  init(navigation: UINavigationController, characterFactory: CharactersFactory) {
    self.navigation = navigation
    self.characterFactory = characterFactory
  }

  func start() {
    let controller = characterFactory.makeModule(coordinator: self)
    navigation.navigationBar.prefersLargeTitles = true
    navigation.pushViewController(controller, animated: true)
  }
}

extension CharactersCoordinator: CharacterViewControllerCoordinator {
  func didSelectMenuCell(urlDetail: String) {
    print("Navigate to detail")
  }
}
