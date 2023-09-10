//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by Yaroslav on 9.09.23.
//

import UIKit
import Combine

protocol HomeFactory {
  func makeModule() -> UIViewController
}

struct HomeFactoryImp: HomeFactory {
  func makeModule() -> UIViewController {
    let apiClientService = ApiClineServiceImp()
    let menuRepository = MenuRepositoryImp(apiClientService: apiClientService, urlList: Endpoint.baseUrl)
    let loadMenuUseCase = LoadMenuUseCaseImp(menuRepository: menuRepository)
    let state = PassthroughSubject<StateController, Never>()
    let homeViewModel = HomeMenuViewModelImp(state: state, loadMenuUseCase: loadMenuUseCase)
    let homeMenuController = HomeMenuViewController(viewModel: homeViewModel, layout: makeLayout())
    homeMenuController.title = "Rick and Morty"
    return homeMenuController
  }

  private func makeLayout() -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()
    let layoutWidth = (UIScreen.main.bounds.width / 2) - 20
    let layoutHeight = (UIScreen.main.bounds.width / 2) - 20
    layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
    layout.minimumLineSpacing = .zero
    layout.minimumInteritemSpacing = .zero
    layout.sectionInset = UIEdgeInsets(top: .zero, left: 10, bottom: .zero, right: 10)
    return layout
  }
}
