//
//  BasketViewController.swift
//  projectShop-v2
//
//  Created by Ilya Pogozhev on 25.07.2023.
//

import UIKit
import SnapKit

class BasketViewController: UIViewController {
    let basketTableView = UITableView(frame: .zero, style: .insetGrouped)
    let basketID = "BasketID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupScene()
        makeConstraints()
    }
}
private extension BasketViewController {
    func setupScene() {
        view.addSubview(basketTableView)
        basketTableView.delegate = self
        basketTableView.dataSource = self
        basketTableView.register(BasketTableViewCell.self, forCellReuseIdentifier: basketID)
        let barButton = UIBarButtonItem(title: "К оплате", style: .plain, target: self, action: #selector(payment))
        navigationItem.rightBarButtonItem = barButton
    }
    func makeConstraints() {
        basketTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    @objc func payment() {
        let paymentVC = PaymentViewController()
        
        if let sheet = paymentVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 35
            sheet.prefersGrabberVisible = true
            paymentVC.totalAmount = Cart.shared.totalAmount()
        }
        present(paymentVC, animated: true)
    }
}
extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Cart.shared.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = basketTableView.dequeueReusableCell(withIdentifier: basketID, for: indexPath) as! BasketTableViewCell
        let product = Cart.shared.products[indexPath.row]
           cell.configureCell(product: product)
           return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Cart.shared.products.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
}

