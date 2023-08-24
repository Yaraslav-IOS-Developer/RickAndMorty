//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Yaroslav on 22.08.23.
//

import Foundation


struct RMCharacter: Codable {
  let id: Int
  let name: String
  let status: RMCharacterStatus
  let species: String
  let type: String
  let gender: RMCharacterGender
  let image: String
  let episode: [String]
  let url: String
  let created: String
  let origin: RMOrigin
  let location: RMSingleLocation
}
