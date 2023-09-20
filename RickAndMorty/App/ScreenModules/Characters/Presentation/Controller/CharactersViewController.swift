//
//  CharactersViewController.swift
//  RickAndMorty
//
//  Created by Yaroslav on 13.09.23.
//

import UIKit

protocol CharacterViewControllerCoordinator: AnyObject {
  func didSelectMenuCell(urlDetail: String)
}

final class CharactersViewController: UITableViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
  }

  private func configureTableView() {
    tableView.separatorStyle = .none
    tableView.registerCell(ItemCharacterTableViewCell.self)
  }
}

extension CharactersViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(ItemCharacterTableViewCell.self, forIndexPath: indexPath)

    return cell
  }
}
