//
//  CategoriesTableViewCell.swift
//  projectShop-v2
//
//  Created by Ilya Pogozhev on 25.07.2023.
//

import UIKit
import SnapKit

class CategoriesTableViewCell: UITableViewCell {

    let nameCategoriesLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    let imageCategories: UIImageView = {
            let image = UIImageView()
            image.contentMode = .scaleAspectFit
            image.tintColor = .black
            return image
        }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        nameCategoriesLabel.text = nil
        imageCategories.image = nil
       }
}
extension CategoriesTableViewCell {
    func setupCell() {
        contentView.addSubview(nameCategoriesLabel)
        contentView.addSubview(imageCategories)
        contentView.frame = self.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0))
    }
    func makeConstraints() {
        nameCategoriesLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalTo(imageCategories.snp.right).offset(110)
        }
        imageCategories.snp.makeConstraints {
            $0.size.equalTo(40)
            $0.top.equalToSuperview().inset(10)
            $0.left.equalToSuperview().inset(30)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    func configureTableCell(data: Categories) {
        nameCategoriesLabel.text = data.name
        imageCategories.image = data.image
    }
}
