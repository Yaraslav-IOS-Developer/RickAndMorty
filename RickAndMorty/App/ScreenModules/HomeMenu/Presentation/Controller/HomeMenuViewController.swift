//
//  HomeMenuViewController.swift
//  RickAndMorty
//
//  Created by Yaroslav on 7.09.23.
//

import UIKit
import Combine

final class HomeMenuViewController: UICollectionViewController {
  private let viewModel: HomeMenuViewModel
  private var cancellable = Set<AnyCancellable>()

  init(viewModel: HomeMenuViewModel, layout: UICollectionViewFlowLayout) {
    self.viewModel = viewModel
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
      .sink { state in
      switch state {
        case .success:
          self.collectionView.reloadData()
        case .loading:
          print("loading")
        case .fail(error: let error):
          print(error)
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
