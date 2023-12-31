//
//  ItemHomeMenuCell.swift
//  RickAndMorty
//
//  Created by Yaroslav on 9.09.23.
//

import UIKit


final class ItemHomeMenuCell: UICollectionViewCell {
  private let mainContainer: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGroupedBackground
    view.layer.cornerRadius = ViewValues.defaultCornerRadius
    view.layer.masksToBounds = true
    return view
  }()

  private let categoryImage: UIImageView = {
    let image = UIImageView()
    image.image = UIImage(named: Images.defaultImage)
    image.contentMode = .scaleAspectFill
    return image
  }()

  private let titleCategoryLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    return label
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    configUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func configUI() {
    addSubview(mainContainer)
    mainContainer.fillSuperView(widthPadding: ViewValues.normalPadding)

    mainContainer.addSubview(categoryImage)
    categoryImage.fillSuperView()

    configureGradientForTitle()

    mainContainer.addSubview(titleCategoryLabel)
    titleCategoryLabel.setConstraints(
      right: mainContainer.rightAnchor,
      bottom: mainContainer.bottomAnchor,
      left: mainContainer.leftAnchor,
      pRight: ViewValues.normalPadding,
      pBottom: ViewValues.normalPadding,
      pLeft: ViewValues.normalPadding
    )
  }

  private func configureGradientForTitle() {
    let gradientMaskLayer = CAGradientLayer()
    gradientMaskLayer.frame = self.bounds
    gradientMaskLayer.colors = [UIColor.clear.cgColor, UIColor.darkGray.cgColor]
    gradientMaskLayer.locations = [ViewValues.gradientTitleInit, ViewValues.gradientTitleEnd]
    mainContainer.layer.addSublayer(gradientMaskLayer)
  }

  public func configData(viewModel: ItemHomeMenuViewModel) {
    titleCategoryLabel.text = viewModel.title
    categoryImage.image = UIImage(named: viewModel.imageName)
  }
}
