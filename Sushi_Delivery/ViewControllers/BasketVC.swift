//
//  ViewController3.swift
//  Sushi_Delivery
//
//  Created by Игорь Пачкин on 9/6/23.
//

import UIKit

class BasketVC: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var myTableView = UITableView()
    
    var productsInBasket: [String: Product] = [:]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Корзина"
        
        self.myTableView = UITableView(frame: view.bounds, style: .plain)
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        myTableView.register(TableViewCell.self, forCellReuseIdentifier: "YourCellIdentifier")

        
        view.addSubview(myTableView)
        
        
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productsInBasket.count
        }

    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YourCellIdentifier", for: indexPath) as! TableViewCell
        
        let product = Array(productsInBasket.values)[indexPath.row]
        cell.customImageView.image = product.image
        cell.customTitleLabel.text = product.title
        cell.customPriceLabel.text = product.price
        cell.sumLabel.text = "\(product.quantity)" // Настройка количества
        //cell.layer.borderColor = UIColor.white.cgColor // Устанавливает красный цвет границы ячейки
        //cell.layer.borderWidth = 1.0 // Устанавливает ширину границы ячейки в 2 пикселя

    
        return cell

        }
    

}

extension BasketVC: ViewController2Delegate {
    // Метод делегата для добавления продукта в корзину
        func didSelectProduct(image: UIImage, title: String, price: String) {
            if let existingProduct = productsInBasket[title] {
                // Если продукт уже в корзине, обновляем количество
                let updatedProduct = Product(image: existingProduct.image, title: existingProduct.title, price: existingProduct.price, quantity: existingProduct.quantity + 1)
                productsInBasket[title] = updatedProduct
            } else {
                // Если продукта нет в корзине, добавляем его
                let newProduct = Product(image: image, title: title, price: price, quantity: 1)
                productsInBasket[title] = newProduct
            }
            
            // Обновляем таблицу
            myTableView.reloadData()
        }
    
}
