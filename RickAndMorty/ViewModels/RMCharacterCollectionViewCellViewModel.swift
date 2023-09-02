//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Yaroslav on 28.08.23.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel {
  private let characterStatus: RMCharacterStatus
  private let characterImageUrl: URL?

  public let characterName: String
  public var characterStatusText: String {
    return "Status: \(characterStatus.text)"
  }

  init(
    characterName: String,
    characterStatus: RMCharacterStatus,
    characterImageUrl: URL?
  ) {
    self.characterName = characterName
    self.characterStatus = characterStatus
    self.characterImageUrl = characterImageUrl
  }

  public func fetchImage(completion: @escaping(Result<Data, Error>) -> Void) {
    guard let url = characterImageUrl else {
      completion(.failure(URLError(.badURL)))
      return
    }
    let request = URLRequest(url: url)
    let task = URLSession.shared.dataTask(with: request) { data, _, error in
      guard let data = data, error == nil else {
        completion(.failure(error ?? URLError(.badServerResponse)))
        return
      }
      completion(.success(data))
    }
    task.resume()
  }
}
