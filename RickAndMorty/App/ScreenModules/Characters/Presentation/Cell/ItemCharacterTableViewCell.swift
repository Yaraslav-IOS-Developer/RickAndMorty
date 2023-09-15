//
//  ItemCharacterTableViewCell.swift
//  RickAndMorty
//
//  Created by Yaroslav on 15.09.23.
//

import UIKit

final class ItemCharacterTableViewCell: UITableViewCell {
  private let mainContainerView: UIView = {
    let view = UIView()
    view.backgroundColor = .tertiarySystemGroupedBackground
    view.setHeightConstraint(with: ViewValues.defaultHeightContainerCell)
    view.layer.cornerRadius = ViewValues.defaultCornerRadius
    view.layer.masksToBounds = true
    return view
  }()

  private let characterImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.setWidthConstraint(with: ViewValues.defaultHeightContainerCell)
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()

  private var labelContainerStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .fillEqually
    return stackView
  }()

  private let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(
      forTextStyle: .headline,
      compatibleWith: UITraitCollection(legibilityWeight: .bold)
    )
    label.textColor = .systemBlue
    return label
  }()

  private let statusLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .callout)
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

//extension ItemCharacterTableViewCell: Reusable { }
