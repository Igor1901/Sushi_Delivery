//
//  ViewController2.swift
//  Sushi_Delivery
//
//  Created by Игорь Пачкин on 9/6/23.
//

import UIKit

protocol ViewController2Delegate: AnyObject {
    func didSelectProduct(image: UIImage, title: String, price: String)
}


struct Product {
    let image: UIImage
    let title: String
    let price: String
    var quantity: Int // Новое поле для отслеживания количества продуктов

    // Инициализатор структуры
    init(image: UIImage, title: String, price: String, quantity: Int) {
        self.image = image
        self.title = title
        self.price = price
        self.quantity = quantity
    }
}


class CatalogVC: UIViewController, UICollectionViewDataSource {
    weak var delegate: ViewController2Delegate?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        return collectionView
    }()
    
    var tableViewData: [Product] = []
    
    let cellIdentifier = "CustomCell"
    var images: [String] = []
    var labels: [String] = []
    var prices: [String] = []
    //var tableViewData: [(image: UIImage, title: String, price: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        addSubviews()
        setConstraints()
        populateTableViewData()
    }
    

    private func configureUI(){
        // Настройте collectionView
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        
        // Настройте внешний вид UICollectionViewFlowLayout
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.minimumInteritemSpacing = 0 // Небольшое пространство между ячейками
        layout?.minimumLineSpacing = 1 // Небольшое пространство между строками
        layout?.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // Отступы от краев
        layout?.scrollDirection = .vertical
        
        collectionView.frame = view.bounds
        
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 1) / 2 // Ширина каждой ячейки (минус пространство между ячейками и отступы)
        layout?.itemSize = CGSize(width: (view.frame.width - 1)/2, height: itemWidth + 100 ) // Размер каждой ячейки
    }
    
    private func addSubviews(){
        view.addSubview(collectionView)
    }
    
    private func setConstraints(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func populateTableViewData() {
        images = ["Abogado", "Ebi", "Hotate", "Maguro", "Syake", "Tamago", "Unagi", "Ikura", "Spicy maguro", "Spicy syake", "Spicy unagi", "Tobiko", "Wakame sarada", "Idaho maki", "O ritsu maki", "Osaka maki", "Yaki maki"]
        labels = images
        prices = ["117 ₽", "147 ₽", "147 ₽", "137 ₽", "127 ₽", "113 ₽", "147 ₽", "229 ₽", "199 ₽", "199 ₽", "199 ₽", "177 ₽", "115 ₽", "497 ₽", "697 ₽", "657 ₽", "637 ₽"]

       
        for (index, imageName) in images.enumerated() {
            let image = UIImage(named: imageName)!
            let title = labels[index]
            let price = prices[index]

            let product = Product(image: image, title: title, price: price, quantity: 0) // Начальное количество 0
            tableViewData.append(product)
        }

    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CollectionViewCell
        
        
        // Настройка содержимого ячейки
        let tuple = tableViewData[indexPath.item]
        let image = tuple.image
        let title = tuple.title
        let price = tuple.price
        
        cell.imageView.image = image
        cell.label.text = title
        cell.button.setTitle(price, for: .normal)
        cell.button.tag = indexPath.item
        cell.button.addTarget(self, action: #selector(priceButtonTapped), for: .touchUpInside)
        
        return cell
    }
    

    
    @objc func priceButtonTapped(_ sender: UIButton) {
        let indexPath = IndexPath(item: sender.tag, section: 0)

        UIView.animate(withDuration: 0.1, animations: {
                sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }) { _ in
                // Возврат к исходному размеру кнопки после анимации
                UIView.animate(withDuration: 0.1) {
                    sender.transform = CGAffineTransform.identity
                }
            }
        
        let image = UIImage(named: images[indexPath.item])
        let title = labels[indexPath.item]
        let price = prices[indexPath.item]

        delegate?.didSelectProduct(image: image ?? UIImage(), title: title, price: price)
        print("Work")
    }

    
}



