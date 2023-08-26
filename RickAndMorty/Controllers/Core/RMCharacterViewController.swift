//
//  RMCharacterViewController.swift
//  RickAndMorty
//
//  Created by Yaroslav on 22.08.23.
//

import UIKit

final class RMCharacterViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    title = "Characters"
    RMService.shared.execute(
      .listCharacterRequest,
      expecting: RMGetAllCharactersResponse.self) { result in
        switch result {
          case .success(let model):
            print(model)
          case .failure(let error):
            print(error)
        }
      }
  }
}
