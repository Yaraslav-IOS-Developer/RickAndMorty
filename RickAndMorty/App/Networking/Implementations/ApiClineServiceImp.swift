//
//  ApiClineServiceImp.swift
//  RickAndMorty
//
//  Created by Yaroslav on 10.09.23.
//

import Foundation

struct ApiClineServiceImp: ApiClientService {
  private let session: URLSession

  init(session: URLSession = URLSession.shared) {
    self.session = session
  }
  func request<T: Decodable>(url: URL?, type: T.Type) async throws -> T {
    guard let url = url else { throw ApiError.errorInUrl }
    return try await makeRequest(url: url)
  }

  private func makeRequest<T: Decodable>(url: URL) async throws -> T {
    let request = try await session.data(from: url)
    return try validateRequest(request: request)
  }

  private func validateRequest<T: Decodable>(request: (data: Data, httpResponse: URLResponse)) throws -> T {
    guard let httpResponse = request.httpResponse as? HTTPURLResponse else { throw ApiError.unknownError }

    switch httpResponse.statusCode {
      case HttpResponseStatus.success:
        return try decodeModel(data: request.data)
      case HttpResponseStatus.clientError:
        throw ApiError.clientError
      case HttpResponseStatus.serverError:
        throw ApiError.serverError
      default:
        throw ApiError.unknownError
    }
  }

  private func decodeModel<T: Decodable>(data: Data) throws -> T {
    let decoder = JSONDecoder()

    let model = try? decoder.decode(T.self, from: data)
    guard let model = model else { throw ApiError.errorDecoding }
    return model
  }
}
