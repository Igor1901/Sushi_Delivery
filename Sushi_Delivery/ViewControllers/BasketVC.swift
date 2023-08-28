//
//  ViewController3.swift
//  Sushi_Delivery
//
//  Created by Игорь Пачкин on 9/6/23.
//

import UIKit

class BasketVC: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var myTableView = UITableView()
    //var images: [String] = []
    //var labels: [String] = []
    //var prices: [String] = []
    var tableViewData: [(image: UIImage, title: String, price: String)] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Корзина"
        
        self.myTableView = UITableView(frame: view.bounds, style: .plain)
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        myTableView.register(TableViewCell.self, forCellReuseIdentifier: "YourCellIdentifier")
        
        
        //images = ["Abogado", "Ebi", "Hotate", "Maguro", "Syake", "Tamago", "Unagi", "Ikura", "Spicy maguro", "Spicy syake", "Spicy unagi", "Tobiko", "Wakame sarada", "Idaho maki", "O ritsu maki", "Osaka maki", "Yaki maki"]
        //labels = images
        //prices = ["117 ₽","147 ₽", "147 ₽", "137 ₽", "127 ₽", "113 ₽", "147 ₽", "229 ₽", "199 ₽", "199 ₽", "199 ₽", "177 ₽", "115 ₽", "497 ₽", "697 ₽", "657 ₽", "637 ₽"]
        
        view.addSubview(myTableView)
        
        
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
        }

    /* старая функция, использовал для настройки ячеек
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell(style: .default, reuseIdentifier: "TableViewCell")
        
        let imageName = images[indexPath.item]
        let labelTitle = labels[indexPath.item]
        let price = prices[indexPath.item]
            
        cell.customImageView.image = UIImage(named: imageName)
        cell.customTitleLabel.text = labelTitle
        cell.customPriceLabel.text = price
        return cell
       } */
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "YourCellIdentifier", for: indexPath) as! TableViewCell
            
            let tuple = tableViewData[indexPath.row]
            let image = tuple.image
            let title = tuple.title
            let price = tuple.price
            
            cell.customImageView.image = image
            cell.customTitleLabel.text = title
            cell.customPriceLabel.text = price
            
            return cell

        }
    

}

extension BasketVC: ViewController2Delegate {
    func didSelectProduct(image: UIImage, title: String, price: String) {
        // Assuming you have an array to store the data for the TableView
        tableViewData.append((image, title, price))
        
        let index = IndexPath(row: tableViewData.endIndex - 1, section: 0)
        myTableView.insertRows(at: [index], with: .automatic)
    }
    
}
