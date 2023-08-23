//
//  RMService.swift
//  RickAndMorty
//
//  Created by Yaroslav on 23.08.23.
//

import Foundation

final class RMService {
  static let shared = RMService()

  private init() {}

  public func execute(_ request: RMRequest, completion: @escaping () -> Void) {

  }
}
