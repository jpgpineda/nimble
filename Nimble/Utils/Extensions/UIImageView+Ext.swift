//
//  UIImageView+Ext.swift
//  Nimble
//
//  Created by javier pineda on 09/11/23.
//

import UIKit

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFill) {
        contentMode = mode
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            guard let data = data,
                  let displayImage = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = displayImage
                self.image = self.imageResized(to: CGSize(width: UIScreen.main.bounds.width,
                                                          height: UIScreen.main.bounds.height))
            }
        }
    }
    
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(CGRect(origin: .zero, size: size))
        }
    }
}
