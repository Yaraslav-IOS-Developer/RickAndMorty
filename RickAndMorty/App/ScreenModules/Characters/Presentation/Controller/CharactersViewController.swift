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

}
