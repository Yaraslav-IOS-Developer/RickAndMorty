//
//  RMCharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Yaroslav on 27.08.23.
//

import UIKit

final class RMCharacterListViewViewModel: NSObject {
  func fetchCharacter() {
    RMService.shared.execute(
      .listCharacterRequest,
      expecting: RMGetAllCharactersResponse.self) { result in
        switch result {
          case .success(let model):
            print(model)
          case .failure(let error):
            print(error)
        }
      }
  }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 20
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(RMCharacterCollectionViewCell.self, forIndexPath: indexPath)
      let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "Test",
                                                             characterStatus: .alive,
                                                             characterImageUrl: URL(string: "https://s1.gifyu.com/images/best-nature-place-hd-images-2-nature-wallpaper-posted-in-hd.jpg") )
      cell.configure(with: viewModel)
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