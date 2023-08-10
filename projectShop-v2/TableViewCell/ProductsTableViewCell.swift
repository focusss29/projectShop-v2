//
//  ProductsTableViewCell.swift
//  projectShop-v2
//
//  Created by Ilya Pogozhev on 27.07.2023.
//

import UIKit
import SnapKit

class ProductsTableViewCell: UITableViewCell {
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
    let buttonBasket: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "basket"), for: .normal)
        button.addTarget(self, action: #selector(addToBasket), for: .touchUpInside)
        button.imageView!.contentMode = .scaleAspectFit
        button.frame.size = CGSize.init(width: 50, height: 50)

        return button
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
private extension ProductsTableViewCell {
    func makeConstraints() {
        productLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-10)
            $0.left.equalToSuperview().inset(25)
        }
        buttonBasket.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(5)
            $0.right.equalToSuperview().inset(25)
            $0.top.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(productLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().inset(25)
        }
    }
    func setupCell() {
        contentView.addSubview(productLabel)
        contentView.addSubview(buttonBasket)
        contentView.addSubview(priceLabel)
    }
}
extension ProductsTableViewCell {
    func configureCell(product: Products?) {
        productLabel.text = product?.name
        priceLabel.text = "Цена: \(product?.price ?? 0)$"
        self.product = product
    }
    @objc func addToBasket() {
        guard let product = product else {
            return
        }
        Cart.shared.products.append(product) 
    }
}

