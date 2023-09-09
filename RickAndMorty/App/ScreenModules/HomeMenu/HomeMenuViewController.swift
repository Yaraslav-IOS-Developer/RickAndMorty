//
//  HomeMenuViewController.swift
//  RickAndMorty
//
//  Created by Yaroslav on 7.09.23.
//

import UIKit

final class HomeMenuViewController: UICollectionViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .blue
    configUI()
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
    return 4
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(ItemHomeMenuCell.self, forIndexPath: indexPath)
    return cell
  }
}
