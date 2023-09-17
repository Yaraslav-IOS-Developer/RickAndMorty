//
//  UITableView+Extension.swift
//  RickAndMorty
//
//  Created by Yaroslav on 17.09.23.
//

import UIKit

extension UITableView {
  func registerCell<CellType: UITableViewCell>(_ cellClass: CellType.Type) {
    let identifier = String(describing: cellClass)
    register(cellClass, forCellReuseIdentifier: identifier)
  }

  func dequeueReusableCell<CellType: UITableViewCell>(_ cellClass: CellType.Type, forIndexPath indexPath: IndexPath) -> CellType {
    let identifier = String(describing: cellClass)
    guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CellType else {
      fatalError("Failed to dequeue cell with identifier: \(identifier)")
    }
    return cell
  }
}
