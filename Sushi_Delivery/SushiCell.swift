import UIKit

class SushiCell: UICollectionViewCell {
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let compositionLabel = UILabel()
    let priceButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Настройте внешний вид и размещение элементов с использованием anchors
        
        // Пример кода для настройки внешнего вида imageView
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        contentView.addSubview(imageView)
        
        // Пример кода для настройки внешнего вида titleLabel
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)
        
        // Пример кода для настройки внешнего вида compositionLabel
        compositionLabel.font = UIFont.systemFont(ofSize: 14)
        compositionLabel.numberOfLines = 0
        contentView.addSubview(compositionLabel)
        
        // Пример кода для настройки внешнего вида priceButton
        priceButton.setTitleColor(.blue, for: .normal)
        contentView.addSubview(priceButton)
        
        // Настройка constraints с помощью anchors
        // Например:
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        compositionLabel.translatesAutoresizingMaskIntoConstraints = false
        priceButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Constraints для imageView
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        
        // Constraints для titleLabel
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        // Constraints для compositionLabel
        compositionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        compositionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        compositionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        
        // Constraints для priceButton
        priceButton.topAnchor.constraint(equalTo: compositionLabel.bottomAnchor, constant: 10).isActive = true
        priceButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        priceButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        priceButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
