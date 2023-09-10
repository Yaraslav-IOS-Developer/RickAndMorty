//
//  ApiClientService.swift
//  RickAndMorty
//
//  Created by Yaroslav on 10.09.23.
//

import Foundation

protocol ApiClientService {
  func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T
}

