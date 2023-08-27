//
//  UIView+Extension.swift
//  RickAndMorty
//
//  Created by Yaroslav on 27.08.23.
//

import UIKit

extension UIView {
  func addSubviews(_ views: UIView...) {
    views.forEach({
      self.addSubview($0)
    })
  }
}
