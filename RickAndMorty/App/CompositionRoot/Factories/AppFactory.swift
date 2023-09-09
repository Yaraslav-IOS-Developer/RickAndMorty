//
//  AppFactory.swift
//  RickAndMorty
//
//  Created by Yaroslav on 8.09.23.
//

import UIKit

protocol AppFactory {
  func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator
}

struct AppFactoryImp: AppFactory {
  func makeHomeCoordinator(navigation: UINavigationController) -> Coordinator {
    let homeFactory = HomeFactoryImp()
    let homeCoordinator = HomeCoordinator(navigation: navigation, homeFactory: homeFactory)
    return homeCoordinator
  }
}
