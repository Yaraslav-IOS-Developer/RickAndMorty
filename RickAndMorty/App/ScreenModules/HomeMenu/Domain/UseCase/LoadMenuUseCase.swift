//
//  LoadMenuUseCase.swift
//  RickAndMorty
//
//  Created by Yaroslav on 9.09.23.
//

import Foundation

protocol LoadMenuUseCase {
  func execute() async -> Result<[MenuItem], Error>
}

struct LoadMenuUseCaseImp: LoadMenuUseCase {
  let menuRepository: MenuRepository
  func execute() async -> Result<[MenuItem], Error> {
    do {
      let repositoryResult = try await menuRepository.fetchMenuData()
      return .success(repositoryResult)
    } catch let myError {
      return .failure(myError)
    }
  }
}
