//
//  MainViewController.swift
//  projectShop-v2
//
//  Created by Ilya Pogozhev on 25.07.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let tableCellId = "TableCellID"
    let mainTableView = UITableView(frame: .zero, style: .insetGrouped)
    var selectedCategoryName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupScene()
        makeConstraints()
    }
}

private extension MainViewController {
    func setupScene() {
        
        // TableView
        view.addSubview(mainTableView)
        mainTableView.backgroundColor = .systemBackground
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(CategoriesTableViewCell.self, forCellReuseIdentifier: tableCellId)
        mainTableView.isScrollEnabled = true
        
        
        //NavigationBar
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .headline)]
    }
    func makeConstraints() {
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: tableCellId, for: indexPath) as! CategoriesTableViewCell
        cell.configureTableCell(data: categories[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productsVC = ProductsViewController()
        productsVC.view.backgroundColor = .systemBackground
        let selectedCategory = categories[indexPath.row]
        productsVC.title = selectedCategory.name
        productsVC.selectedCategory = selectedCategory
        navigationController?.pushViewController(productsVC, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        10
    }
}
