//
//  ViewController.swift
//  RickAndMorty
//
//  Created by Yaroslav on 22.08.23.
//

import UIKit

final class RMTabBarViewController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setUpTabBar()
  }

  private func setUpTabBar() {
    let charactersViewController = RMCharacterViewController()
    let locationsViewController = RMLocationViewController()
    let episodesViewController = RMEpisodeViewController()
    let settingsViewController = RMSettingsViewController()

    let navigationCharacters = UINavigationController(rootViewController: charactersViewController)
    let navigationLocations = UINavigationController(rootViewController: locationsViewController)
    let navigationEpisodes = UINavigationController(rootViewController: episodesViewController)
    let navigationSettings = UINavigationController(rootViewController: settingsViewController)

    navigationCharacters.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 1)
    navigationLocations.tabBarItem = UITabBarItem(title: "Locations", image: UIImage(systemName: "globe"), tag: 2)
    navigationEpisodes.tabBarItem = UITabBarItem(title: "Episodes", image: UIImage(systemName: "tv"), tag: 3)
    navigationSettings.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 4)

    for navigation in [navigationCharacters, navigationLocations, navigationEpisodes, navigationSettings] {
      navigation.navigationBar.prefersLargeTitles = true
      navigation.navigationItem.largeTitleDisplayMode = .always
    }

    setViewControllers([
      navigationCharacters,
      navigationLocations,
      navigationEpisodes,
      navigationSettings
    ], animated: true)
  }
}

