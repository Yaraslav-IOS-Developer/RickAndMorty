//
//  SpinnerDisplayable.swift
//  RickAndMorty
//
//  Created by Yaroslav on 10.09.23.
//

import UIKit

protocol SpinnerDisplayable: AnyObject {
  func showSpinner()
  func hideSpinner()
}

extension SpinnerDisplayable where Self: UIViewController {
  func showSpinner() {
    guard doesNotExistAnotherSpinner else { return }
    let containerView = UIView()
    view.addSubview(containerView)
    containerView.fillSuperView()
    containerView.backgroundColor = .black.withAlphaComponent(ViewValues.opacityContainerSpinner)
    containerView.tag = tagIdentifier

    let spinner = UIActivityIndicatorView(style: .large)
    containerView.addSubview(spinner)
    spinner.translatesAutoresizingMaskIntoConstraints = false

    spinner.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
    spinner.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    containerView.isUserInteractionEnabled = false
    spinner.startAnimating()
  }

  private func addSpinnerIndicatorToContainer(containerView: UIView) {
    let spinner = UIActivityIndicatorView(style: .large)
    spinner.startAnimating()
    containerView.addSubview(spinner)
    containerView.isUserInteractionEnabled = false
    spinner.centerXY()
  }

  func hideSpinner() {
    if let foundView = view.viewWithTag(tagIdentifier) {
      foundView.removeFromSuperview()
    }
  }

  private var doesNotExistAnotherSpinner: Bool {
    view.viewWithTag(tagIdentifier) == nil
  }

  private var tagIdentifier: Int {
    ViewValues.tagIdentifierSpinner
  }
}
