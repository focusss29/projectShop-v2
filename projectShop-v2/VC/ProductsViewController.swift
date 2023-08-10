//
//  ProductsViewController.swift
//  projectShop-v2
//
//  Created by Ilya Pogozhev on 25.07.2023.
//

import UIKit
import SnapKit

class ProductsViewController: UIViewController {
    
    var selectedCategory: Categories?
    
    let productTableView = UITableView(frame: .zero, style: .insetGrouped)
    let productID = "productID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        makeConstraints()
    }
}
private extension ProductsViewController {
    func setupScene() {
        view.addSubview(productTableView)
        productTableView.delegate = self
        productTableView.dataSource = self
        productTableView.register(ProductsTableViewCell.self, forCellReuseIdentifier: productID)
    }
    func makeConstraints() {
        productTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        selectedCategory?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTableView.dequeueReusableCell(withIdentifier: productID, for: indexPath) as! ProductsTableViewCell
           let product = selectedCategory?.products[indexPath.row]
           cell.configureCell(product: product!)
           return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
