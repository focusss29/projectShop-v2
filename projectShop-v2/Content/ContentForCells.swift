//
//  ContentForCells.swift
//  projectShop-v2
//
//  Created by Ilya Pogozhev on 25.07.2023.
//

import UIKit

struct Categories {
    let name: String
    let image: UIImage?
    var products: [Products]
}
struct Products {
    let name: String
    var price: Int
}


var categories: [Categories] = [
    Categories(name: "Смартфоны", image: UIImage(systemName: "iphone.gen2"), products: [
        Products(name: "IPhone 14 128Gb", price: 799),
        Products(name: "IPhone 14 Pro 256Gb", price: 899),
        Products(name: "IPhone 14 Pro Max 512Gb", price: 1199),
        Products(name: "iPhone 14 Plus 256Gb", price: 849),
        Products(name: "IPhone 13 Pro Max 1Tb", price: 999)
    ]),
    Categories(name: "Ноутбуки", image: UIImage(systemName: "laptopcomputer"), products: [
        Products(name: "MacBook Air 13 M1", price: 899),
        Products(name: "MacBook Pro 14 M2", price: 1199),
        Products(name: "MacBook Pro 16 M1", price: 1299),
        Products(name: "MacBook Air 13 M2", price: 1099),
        Products(name: "MacBook Pro 16 M2 Pro", price: 1999)
    ]), Categories(name: "Планшеты", image: UIImage(systemName: "ipad.gen1"), products: [
        Products(name: "iPad 2021 64Gb", price: 699),
        Products(name: "iPad Pro 2022 128Gb", price: 899),
        Products(name: "iPad Air 2022 256Gb", price: 999),
        Products(name: "iPad mini 2021 64Gb", price: 599),
        Products(name: "iPad Pro 2022 256Gb", price: 1199)
    ]), Categories(name: "Наушники", image: UIImage(systemName: "airpodsmax"), products: [
            Products(name: "AirPods 2", price: 199),
            Products(name: "AirPods Pro", price: 249),
            Products(name: "AirPods Max", price: 499),
            Products(name: "AirPods 3", price: 229),
            Products(name: "AirPods Pro 2nd", price: 299)
    ]), Categories(name: "Компьютеры", image: UIImage(systemName: "display.2"), products: [
            Products(name: "iMac 24 2021 M1 8RAM", price: 1199),
            Products(name: "Mac Studio 2022 M1 Max 64RAM", price: 1499),
            Products(name: "Mac Mini 2020 M1 8RAM", price: 999),
            Products(name: "iMac 24 2021 M1 16RAM", price: 1299),
            Products(name: "Mac Mini 2023 M2 8RAM", price: 1599)
    ]), Categories(name: "Смарт-часы", image: UIImage(systemName: "applewatch.watchface"), products: [
        Products(name: "Apple Watch Series 8 45mm", price: 599),
        Products(name: "Apple Watch SE 44mm", price: 499),
        Products(name: "Apple Watch Ultra 49mm", price: 799),
        Products(name: "Apple Watch SE 40mm", price: 399),
        Products(name: "Apple Watch Series 8 41mm", price: 499)
    ]), Categories(name: "Аксессуары", image: UIImage(systemName: "airtag"), products: [
        Products(name: "Apple AirTag", price: 29),
        Products(name: "Apple Magic Mouse 2", price: 49),
        Products(name: "Apple Magic Trackpad 2", price: 49),
        Products(name: "Apple USB-C Power Adapter", price: 19),
        Products(name: "Apple MagSafe", price: 9)])]

var basket: [Products] = []
