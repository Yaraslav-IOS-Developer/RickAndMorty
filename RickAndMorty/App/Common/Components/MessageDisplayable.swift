//
//  MessageDisplayable.swift
//  RickAndMorty
//
//  Created by Yaroslav on 10.09.23.
//

import UIKit

protocol MessageDisplayable { }

extension MessageDisplayable where Self: UIViewController {
  func showAlert(message: String, title: String) {
    let alertController = UIAlertController(
      title: title,
      message: message,
      preferredStyle:.alert
    )
    let okAction = UIAlertAction(title: AppLocalized.okButton, style: .default)
    alertController.addAction(okAction)
    self.present(alertController, animated: true)
  }
}
