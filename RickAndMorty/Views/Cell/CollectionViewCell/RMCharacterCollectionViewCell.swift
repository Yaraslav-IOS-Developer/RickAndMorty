//
//  RMCharacterCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Yaroslav on 28.08.23.
//

import UIKit

final class RMCharacterCollectionViewCell: UICollectionViewCell {
  private let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()

  private let nameLabel: UILabel = {
    let label = UILabel()
    label.textColor = .label
    label.font = .systemFont(ofSize: 18, weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let statusLabel: UILabel = {
    let label = UILabel()
    label.textColor = .secondaryLabel
    label.font = .systemFont(ofSize: 16, weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func prepareForReuse() {
    super.prepareForReuse()
    imageView.image = nil
    nameLabel.text = nil
    statusLabel.text = nil
  }

  private func setupUI() {
    contentView.addSubviews(imageView, nameLabel, statusLabel)
    addConstraint()
  }

  private func addConstraint() {
    NSLayoutConstraint.activate([
      statusLabel.heightAnchor.constraint(equalToConstant: 40),
      nameLabel.heightAnchor.constraint(equalToConstant: 40),

      statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
      statusLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
      nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
      nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),

      statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
      nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),

      imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
      imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3)
    ])
  }

  public func configure(with viewModel: RMCharacterCollectionViewCellViewModel) {
    nameLabel.text = viewModel.characterName
    statusLabel.text = viewModel.characterStatusText
    viewModel.fetchImage { [weak self] result in
      guard let sSelf = self else { return }
      switch result {
        case .success(let data):
          DispatchQueue.main.async {
            let image = UIImage(data: data)
            sSelf.imageView.image = image
          }
        case .failure(let error):
          print(String(describing: error))
        break
      }
    }
  }
}