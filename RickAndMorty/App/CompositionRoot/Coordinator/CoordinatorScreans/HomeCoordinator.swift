//
//  HomeCoordinator.swift
//  RickAndMorty
//
//  Created by Yaroslav on 9.09.23.
//

import UIKit

final class HomeCoordinator: Coordinator {
  var navigation: UINavigationController
  private let homeFactory: HomeFactory

  init(navigation: UINavigationController, homeFactory: HomeFactory) {
    self.navigation = navigation
    self.homeFactory = homeFactory
  }

  func start() {
    let controller = homeFactory.makeModule(coordinator: self)
    navigation.pushViewController(controller, animated: true)
  }
}

extension HomeCoordinator: HomeMenuViewControllerCoordinator {
  func didSelectMenuCell(model: MenuItem) {
    switch model.title {
      case "characters":
        goToCharacters()
      case "episodes":
        goToEpisodes()
      case "locations":
        goToLocations()
      default:
        break
    }
  }

  private func goToCharacters() {
    print("screen characters")
  }

  private func goToEpisodes() {
    print("screen episodes")
  }

  private func goToLocations() {
    print("screen locations")
  }
}
