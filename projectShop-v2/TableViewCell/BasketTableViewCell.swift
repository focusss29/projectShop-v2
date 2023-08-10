//
//  BasketTableViewCell.swift
//  projectShop-v2
//
//  Created by Ilya Pogozhev on 29.07.2023.
//

import UIKit
import SnapKit

class BasketTableViewCell: UITableViewCell {
    var product: Products?
    
    let productLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .systemGray
        return label
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
        productLabel.text = nil
        priceLabel.text = nil
    }
}
private extension BasketTableViewCell {
    func makeConstraints() {
        productLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-10)
            $0.left.equalToSuperview().inset(25)
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(productLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().inset(25)
        }
    }
    func setupCell() {
        contentView.addSubview(productLabel)
        contentView.addSubview(priceLabel)
    }
}
extension BasketTableViewCell {
    func configureCell(product: Products?) {
        productLabel.text = product?.name
        priceLabel.text = "Цена: \(product?.price ?? 0)$"
    }
}
