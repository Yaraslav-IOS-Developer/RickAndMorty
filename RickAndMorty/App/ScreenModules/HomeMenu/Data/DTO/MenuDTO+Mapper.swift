//
//  MenuDTO+Mapper.swift
//  RickAndMorty
//
//  Created by Yaroslav on 10.09.23.
//

import Foundation

extension MenuDTO {
  func toDomain() -> [MenuItem] {
    return self.dictionaryProperties().map { dictionary in
      let title = dictionary.key
      let url: String = (dictionary.value as? String) ?? String()
      return MenuItem(title: title, url: url)
    }
  }
}
