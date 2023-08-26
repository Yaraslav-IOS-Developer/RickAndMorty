//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by Yaroslav on 23.08.23.
//

import Foundation


final class RMRequest {

  private struct Constants {
    static let baseUrl = "https://rickandmortyapi.com/api"
  }

  private let endPoint: RMEndpoint
  private let patchComponents: [String]
  private let queryParameters: [URLQueryItem]
  private var urlString: String {
    var string = Constants.baseUrl
    string += "/"
    string += endPoint.rawValue

    if !patchComponents.isEmpty {
      patchComponents.forEach({
        string += "/\($0)"
      })
    }

    if !queryParameters.isEmpty {
      string += "?"
      let argumentString = queryParameters.compactMap({
        guard let value = $0.value else { return nil }
        return "\($0.name)=\(value)"
      }).joined(separator: "&")
      string += argumentString
    }
    return string
  }

  public var url: URL? {
    return URL(string: urlString)
  }

  public let httpMethod = "GET"

  public init(
    endPoint: RMEndpoint,
    patchComponents: [String] = [],
    queryParameters: [URLQueryItem] = []
  ) {
    self.endPoint = endPoint
    self.patchComponents = patchComponents
    self.queryParameters = queryParameters
  }
}

extension RMRequest {
  static let listCharacterRequest = RMRequest(endPoint: .character)
}
