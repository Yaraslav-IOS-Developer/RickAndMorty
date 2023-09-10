//
//  HttpResponseStatus.swift
//  RickAndMorty
//
//  Created by Yaroslav on 10.09.23.
//

import Foundation

enum HttpResponseStatus {
  static let success = 200...299
  static let clientError = 400...499
  static let serverError = 500...599
}
