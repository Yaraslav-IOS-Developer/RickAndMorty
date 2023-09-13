//
//  HomeMenuViewController.swift
//  RickAndMorty
//
//  Created by Yaroslav on 7.09.23.
//

import UIKit
import Combine

protocol HomeMenuViewControllerCoordinator: AnyObject {
  func didSelectMenuCell(model: MenuItem)
}

final class HomeMenuViewController: UICollectionViewController {
  private let viewModel: HomeMenuViewModel
  private var cancellable = Set<AnyCancellable>()
  private weak var coordinator: HomeMenuViewControllerCoordinator?

  init(
    viewModel: HomeMenuViewModel,
    layout: UICollectionViewFlowLayout,
    coordinator: HomeMenuViewControllerCoordinator
  ) {
    self.viewModel = viewModel
    self.coordinator = coordinator
    super.init(collectionViewLayout: layout)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
    stateController()
    viewModel.viewDidLoad()
  }

  private func stateController() {
    viewModel
      .state
      .receive(on: RunLoop.main)
      .sink { [weak self] state in
        guard let sSelf = self else { return }
        sSelf.hideSpinner()
        switch state {
          case .success:
            sSelf.collectionView.reloadData()
          case .loading:
            sSelf.showSpinner()
          case .fail(error: let error):
            sSelf.showAlert(message: error, title: AppLocalized.error)
        }
      }.store(in: &cancellable)
  }

  private func configUI() {
    configureCollectionView()
  }

  private func configureCollectionView() {
    collectionView.registerCell(ItemHomeMenuCell.self)
  }
}

extension HomeMenuViewController {
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.menuItemsCount
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(ItemHomeMenuCell.self, forIndexPath: indexPath)
    let viewModel = viewModel.getItemMenuViewModel(indexPath: indexPath)
    cell.configData(viewModel: viewModel)
    return cell
  }
}

extension HomeMenuViewController {
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let model = viewModel.getMenuItem(indexPath: indexPath)
    coordinator?.didSelectMenuCell(model: model)
  }
}

extension HomeMenuViewController: SpinnerDisplayable {}

extension HomeMenuViewController: MessageDisplayable {}
