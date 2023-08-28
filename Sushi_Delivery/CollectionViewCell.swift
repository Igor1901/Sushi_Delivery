//
//  File.swift
//  Sushi_Delivery
//
//  Created by Игорь Пачкин on 15/6/23.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    let stackView: UIStackView
    let imageView: UIImageView
    let label: UILabel
    let button: UIButton = {
        let button = UIButton(type: .custom)
        button.isEnabled = true
        return button
    }()
    
    override init(frame: CGRect) {
        stackView = UIStackView()
        imageView = UIImageView()
        label = UILabel()
        super.init(frame: frame) 
        
    
        
        // Настройка stackView
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = 15
        stackView.distribution = .fill
        stackView.backgroundColor = UIColor(red: 21/255, green: 22/255, blue: 27/255, alpha: 1)
        
        // Добавление подвью в stackView
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        
        // Настройка imageView
        imageView.contentMode = .scaleAspectFit
        
        // Настройка label
        label.textAlignment = .center
        label.textColor = .white
        label.backgroundColor = UIColor(red: 21/255, green: 22/255, blue: 27/255, alpha: 1)
        label.font = .boldSystemFont(ofSize: 16)
        
        // Настройка button
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(red: 41/255, green: 40/255, blue: 44/255, alpha: 1)
        button.layer.cornerRadius = 8
        
        // Добавление stackView в contentView
        contentView.addSubview(stackView)
        
        // Установка констрейнтов для stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        // Установка констрейнтов для imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor), // Поддерживаем квадратное соотношение сторон
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 20.0),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
        // Установка констрейнтов для button
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 35.0),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20.0),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20.0),
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

