//
//  MenuDTO.swift
//  RickAndMorty
//
//  Created by Yaroslav on 10.09.23.
//

import Foundation

struct MenuDTO: Decodable {
  let characters: String
  let locations: String
  let episodes: String
}

extension MenuDTO: PropertyIterator {}
