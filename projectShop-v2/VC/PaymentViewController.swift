//
//  PaymentViewController.swift
//  projectShop-v2
//
//  Created by Ilya Pogozhev on 10.08.2023.
//

import UIKit
import SnapKit

class PaymentViewController: UIViewController {
    
    var totalAmount: Int = 0
    
    let labelAmount: UILabel = {
        let label = UILabel()
        label.text = " Общая сумма товаров составляет: "
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 45)
        return label
    }()
    let labelTotal: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 65)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        labelTotal.text = "\(totalAmount)$"
        setupScene()
        makeConstraints()
    }
}
private extension PaymentViewController {
    func setupScene() {
        view.addSubview(labelTotal)
        view.addSubview(labelAmount)
    }
    func makeConstraints() {
        labelAmount.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.right.left.equalToSuperview().inset(25)
        }
        labelTotal.snp.makeConstraints {
            $0.top.equalTo(labelAmount.snp.bottom).offset(60)
            $0.left.right.equalToSuperview().inset(50)
        }
    }
}
