//
//  UICollectionView+Extension.swift
//  RickAndMorty
//
//  Created by Yaroslav on 28.08.23.
//

import UIKit

extension UICollectionView {
  func registerNibCell<CellType: UICollectionViewCell>(ofType type: CellType.Type) {
    let nibName = String(describing: type)
    let nib = UINib(nibName: nibName, bundle: nil)
    register(nib, forCellWithReuseIdentifier: nibName)
  }

  func dequeueReusableNibCell<CellType: UICollectionViewCell>(of type: CellType.Type, forIndexPath indexPath: IndexPath) -> UICollectionViewCell {
    let identifier = String(describing: type)
    return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
  }
}
