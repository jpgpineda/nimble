//
//  NimbleButton.swift
//  Nimble
//
//  Created by javier pineda on 04/11/23.
//

import UIKit

class NimbleButton: UIButton {
    override func awakeFromNib() {
        setTitleColor(.systemBackground, for: .normal)
        roundCorners(.allCorners, radius: .eight)
        titleLabel?.font = .systemFont(ofSize: .twenty, weight: .bold)
    }
    
    @IBInspectable var isActive: Bool = false {
        didSet {
            backgroundColor = isActive ? .label : .lightGray
            isEnabled = isActive
        }
    }
}
