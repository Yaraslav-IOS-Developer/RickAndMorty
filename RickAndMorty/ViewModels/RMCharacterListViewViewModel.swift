//
//  RMCharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Yaroslav on 27.08.23.
//

import UIKit

protocol RMCharacterListViewViewModelDelegate: AnyObject {
  func didLoadInitialCharacter()
}

final class RMCharacterListViewViewModel: NSObject {
  private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
  private var characters: [RMCharacter] = [] {
    didSet {
      for character in characters {
        let viewModel = RMCharacterCollectionViewCellViewModel(
          characterName: character.name,
          characterStatus: character.status,
          characterImageUrl: URL(string: character.image)
        )
        cellViewModels.append(viewModel)
      }
    }
  }

  weak var delegate: RMCharacterListViewViewModelDelegate?

  init(delegate: RMCharacterListViewViewModelDelegate?) {
    self.delegate = delegate
  }
  
  public func fetchCharacter() {
    RMService.shared.execute(
      .listCharacterRequest,
      expecting: RMGetAllCharactersResponse.self) {[weak self] result in
        guard let sSelf = self else { return }
        switch result {
          case .success(let responseModel):
            let result = responseModel.results
            sSelf.characters = result
            sSelf.delegate?.didLoadInitialCharacter()
          case .failure(let error):
            print(error)
        }
      }
  }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return cellViewModels.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(RMCharacterCollectionViewCell.self, forIndexPath: indexPath)

    cell.configure(with: cellViewModels[indexPath.row])
    return cell
  }
}

extension RMCharacterListViewViewModel: UICollectionViewDelegate {
  
}

extension RMCharacterListViewViewModel: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let bounds =  UIScreen.main.bounds
    let width = (bounds.width - 30) / 2
    return CGSize(width: width, height: width * 1.5)
  }
}
