//
//  HomeFactory.swift
//  RickAndMorty
//
//  Created by Yaroslav on 9.09.23.
//

import UIKit
import Combine

protocol HomeFactory {
  func makeModule(coordinator: HomeMenuViewControllerCoordinator) -> UIViewController
}

struct HomeFactoryImp: HomeFactory {
  func makeModule(coordinator: HomeMenuViewControllerCoordinator) -> UIViewController {
    let apiClientService = ApiClineServiceImp()
    let menuRepository = MenuRepositoryImp(apiClientService: apiClientService, urlList: Endpoint.baseUrl)
    let loadMenuUseCase = LoadMenuUseCaseImp(menuRepository: menuRepository)
    let state = PassthroughSubject<StateController, Never>()
    let homeViewModel = HomeMenuViewModelImp(state: state, loadMenuUseCase: loadMenuUseCase)
    let homeMenuController = HomeMenuViewController(viewModel: homeViewModel, layout: makeLayout(), coordinator: coordinator)
    homeMenuController.title = AppLocalized.appName
    return homeMenuController
  }

  private func makeLayout() -> UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()
    let layoutWidth = (ViewValues.widthScreen - ViewValues.doublePadding) / ViewValues.multiplierTwo
    let layoutHeight = (ViewValues.widthScreen - ViewValues.doublePadding) / ViewValues.multiplierTwo
    layout.itemSize = CGSize(width: layoutWidth, height: layoutHeight)
    layout.minimumLineSpacing = .zero
    layout.minimumInteritemSpacing = .zero
    layout.sectionInset = UIEdgeInsets(top: .zero, left: ViewValues.normalPadding, bottom: .zero, right: ViewValues.normalPadding)
    return layout
  }
}

