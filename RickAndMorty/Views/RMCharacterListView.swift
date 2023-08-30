//
//  RMCharacterListView.swift
//  RickAndMorty
//
//  Created by Yaroslav on 27.08.23.
//

import UIKit

final class RMCharacterListView: UIView {
  private let viewModel = RMCharacterListViewViewModel()

  private let spinner: UIActivityIndicatorView = {
    let spinner = UIActivityIndicatorView(style: .large)
    spinner.hidesWhenStopped = true
    spinner.translatesAutoresizingMaskIntoConstraints = false
    return spinner
  }()

  private let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.isHidden = true
    collectionView.alpha = 0
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.registerCell(RMCharacterCollectionViewCell.self)

    return collectionView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setupUI() {
    self.translatesAutoresizingMaskIntoConstraints = false
    addSubviews(collectionView, spinner)
    addConstraint()
    spinner.startAnimating()
    viewModel.fetchCharacter()
    setupCollectionView()
  }

  private func addConstraint() {
    NSLayoutConstraint.activate([
      spinner.widthAnchor.constraint(equalToConstant: 100),
      spinner.heightAnchor.constraint(equalToConstant: 100),
      spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
      spinner.centerYAnchor.constraint(equalTo: centerYAnchor),

      collectionView.topAnchor.constraint(equalTo: topAnchor),
      collectionView.leftAnchor.constraint(equalTo: leftAnchor),
      collectionView.rightAnchor.constraint(equalTo: rightAnchor),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }

  private func setupCollectionView() {
    collectionView.dataSource = viewModel
    collectionView.delegate = viewModel

    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
      self.spinner.stopAnimating()
      self.collectionView.isHidden = false
      UIView.animate(withDuration: 0.4) {
        self.collectionView.alpha = 1
      }
    }
  }
}
