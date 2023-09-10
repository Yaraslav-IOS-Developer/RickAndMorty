//
//  ItemHomeMenuViewModel.swift
//  RickAndMorty
//
//  Created by Yaroslav on 9.09.23.
//

import Foundation

struct ItemHomeMenuViewModel {
  private let menuItem: MenuItem

  var title: String {
    menuItem.title.capitalized
  }

  var imageName: String  {
    menuItem.title
  }

  init(menuItem: MenuItem) {
    self.menuItem = menuItem
  }
}
