//
//  Images.swift
//  Nimble
//
//  Created by javier pineda on 10/11/23.
//

import UIKit

extension UIImage {
    static var hiking: UIImage? { return UIImage(named: #function) }
    
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
