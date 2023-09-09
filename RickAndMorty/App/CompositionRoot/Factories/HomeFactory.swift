//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by Yaroslav on 9.09.23.
//

import UIKit

protocol HomeFactory {
  func makeModule() -> UIViewController
}

struct HomeFactoryImp: HomeFactory {
  func makeModule() -> UIViewController {
    let homeMenuController = HomeMenuViewController()
    homeMenuController.title = "Rick and Morty"
    return homeMenuController
  }
}
