//
//  CustomButtonForPassword.swift
//  Sushi_Delivery
//
//  Created by Игорь Пачкин on 8/6/23.
//

import UIKit

class EyeButton: UIButton {
    var firstImage: UIImage?
    var secondImage: UIImage?

    var isToggledOn = false {
        didSet {
            if isToggledOn {
                self.setImage(secondImage, for: .normal)
            } else {
                self.setImage(firstImage, for: .normal)
            }
        }
    }

    func toggle() {
        isToggledOn.toggle()
    }
}
