//
//  UIButton+Ext.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//

import UIKit

extension UIButton {
    @IBInspectable var localized: String {
        set {
            setTitle(.Localized.getLocalizedString(newValue), for: .normal)
        }
        get {
            return title(for: .normal) ?? .empty
        }
    }
    
    func loadImageFromUrl(url: URL) {
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            guard let data = data,
                  let displayImage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.setImage(displayImage, for: .normal)
            }
        }
    }
}
