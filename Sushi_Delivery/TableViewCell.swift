//
//  TableViewCell.swift
//  Sushi_Delivery
//
//  Created by Игорь Пачкин on 1/7/23.
//

import UIKit



class TableViewCell: UITableViewCell {
    
    // Добавьте необходимые представления для отображения данных
    let stackView: UIStackView
    
    let customImageView = UIImageView()
    
    let nameAndPriseView = UIView()
    let customTitleLabel = UILabel()
    let customPriceLabel = UILabel()
    
    let sumView = UIView()
    
    let minusButton = UIButton()
    let minusImage = UIImage(named: "minus")
    
    let plusButton = UIButton()
    let plusImage = UIImage(named: "plus")
    
    let sumLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        stackView = UIStackView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        addSubviews()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI(){
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8.0
        //stackView.backgroundColor = UIColor(red: 21/255, green: 22/255, blue: 27/255, alpha: 1)
        
        
        minusButton.setImage(minusImage, for: .normal)
        minusButton.addTarget(self, action: #selector(minusButtonFunc), for: .touchUpInside)
        
        plusButton.setImage(plusImage, for: .normal)
        plusButton.addTarget(self, action: #selector(plusButtonFunc), for: .touchUpInside)
        
        sumLabel.text = "12"
        sumLabel.textAlignment = .center
        
        customImageView.contentMode = .scaleAspectFit
        
        // Настройка label
        customTitleLabel.textAlignment = .center
        customTitleLabel.textColor = .white
        customTitleLabel.backgroundColor = UIColor(red: 21/255, green: 22/255, blue: 27/255, alpha: 1)
        customTitleLabel.font = .boldSystemFont(ofSize: 16)
        
        // Настройка button
        customPriceLabel.textAlignment = .center
        customPriceLabel.textColor = .white
        customPriceLabel.backgroundColor = UIColor(red: 21/255, green: 22/255, blue: 27/255, alpha: 1)
        customPriceLabel.font = .boldSystemFont(ofSize: 16)
    }
    
    private func addSubviews(){
        nameAndPriseView.addSubview(customTitleLabel)
        nameAndPriseView.addSubview(customPriceLabel)
        
        sumView.addSubview(minusButton)
        sumView.addSubview(sumLabel)
        sumView.addSubview(plusButton)
        
        stackView.addArrangedSubview(customImageView)
        stackView.addArrangedSubview(nameAndPriseView)
        stackView.addArrangedSubview(sumView)
        
        contentView.addSubview(stackView)
    }
    
    private func setConstraints(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        customImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customImageView.heightAnchor.constraint(equalToConstant: 120.0), // Поддерживаем квадратное соотношение сторон
            customImageView.widthAnchor.constraint(equalToConstant: 120.0),
        ])
        
        customTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customTitleLabel.topAnchor.constraint(equalTo: nameAndPriseView.topAnchor, constant: 25.0),
        ])
        
        customPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customPriceLabel.bottomAnchor.constraint(equalTo: nameAndPriseView.bottomAnchor, constant: -25.0),
        ])
        
        nameAndPriseView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameAndPriseView.heightAnchor.constraint(equalTo: customImageView.heightAnchor), // Поддерживаем квадратное соотношение сторон
            nameAndPriseView.widthAnchor.constraint(equalTo: customImageView.widthAnchor),
        ])
        
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            minusButton.widthAnchor.constraint(equalToConstant: 25.0),
            minusButton.heightAnchor.constraint(equalToConstant: 25.0),
            minusButton.centerYAnchor.constraint(equalTo: sumView.centerYAnchor)
        ])
        
        sumLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sumLabel.leadingAnchor.constraint(equalTo: minusButton.trailingAnchor, constant: 20.0),
            sumLabel.widthAnchor.constraint(equalToConstant: 25.0),
            sumLabel.heightAnchor.constraint(equalToConstant: 25.0),
            sumLabel.centerYAnchor.constraint(equalTo: sumView.centerYAnchor),
            sumLabel.centerXAnchor.constraint(equalTo: sumView.centerXAnchor)
        ])
        
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: sumLabel.trailingAnchor, constant: 20.0),
            plusButton.widthAnchor.constraint(equalToConstant: 25.0),
            plusButton.heightAnchor.constraint(equalToConstant: 25.0),
            plusButton.centerYAnchor.constraint(equalTo: sumView.centerYAnchor)
        ])
        
        sumView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sumView.heightAnchor.constraint(equalTo: customImageView.heightAnchor), // Поддерживаем квадратное соотношение сторон
            sumView.widthAnchor.constraint(equalTo: customImageView.widthAnchor),
        ])
        
        
    }
    
    @objc func minusButtonFunc(){
        guard let currentNumber = Int(sumLabel.text ?? "0") else {
                return
            }
            
            if currentNumber > 0 {
                let updatedNumber = currentNumber - 1
                sumLabel.text = String(updatedNumber)
            }
    }
    
    @objc func plusButtonFunc(){
        guard let currentNumber = Int(sumLabel.text ?? "99") else {
                return
            }
            
            if currentNumber < 99 {
                let updatedNumber = currentNumber + 1
                sumLabel.text = String(updatedNumber)
            }
    }

}

