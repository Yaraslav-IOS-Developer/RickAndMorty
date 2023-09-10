//
//  MenuRepository.swift
//  RickAndMorty
//
//  Created by Yaroslav on 9.09.23.
//

protocol MenuRepository {
  func fetchMenuData() async throws -> [MenuItem]
}
