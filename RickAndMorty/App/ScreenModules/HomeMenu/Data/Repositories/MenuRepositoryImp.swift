//
//  MenuRepositoryImp.swift
//  RickAndMorty
//
//  Created by Yaroslav on 9.09.23.
//

import Foundation

struct MenuRepositoryImp: MenuRepository {
  let apiClientService: ApiClientService
  let urlList: String

  func fetchMenuData() async throws -> [MenuItem] {
    let url = URL(string: urlList)
    return try await apiClientService.request(url: url, type: MenuDTO.self).toDomain()
  }
}
