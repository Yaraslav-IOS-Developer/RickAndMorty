//
//  UICollectionView+Extension.swift
//  RickAndMorty
//
//  Created by Yaroslav on 28.08.23.
//

import UIKit

extension UICollectionView {
  func registerCell<CellType: UICollectionViewCell>(_ cellClass: CellType.Type) {
    let identifier = String(describing: cellClass)
    register(cellClass, forCellWithReuseIdentifier: identifier)
  }

  func dequeueReusableCell<CellType: UICollectionViewCell>(_ cellClass: CellType.Type, forIndexPath indexPath: IndexPath) -> CellType {
    let identifier = String(describing: cellClass)
    guard let cell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? CellType else {
      fatalError("Failed to dequeue cell with identifier: \(identifier)")
    }
    return cell
  }
}
