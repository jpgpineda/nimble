//
//  NimbleDashedButton.swift
//  Nimble
//
//  Created by javier pineda on 05/11/23.
//

import UIKit

class NimbleDashedButton: UIButton {
    var dashedLine = CAShapeLayer()
    
    override func awakeFromNib() {
        setUp()
    }
    
    private func setUp() {
        dashedLine.strokeColor = UIColor.white.cgColor
        dashedLine.lineWidth = .two
        titleLabel?.font = .systemFont(ofSize: .fifthteen, weight: .semibold)
        setTitleColor(.white, for: .normal)
        layer.addSublayer(dashedLine)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        dashedLine.lineDashPattern = [8, 3]
        dashedLine.path = path.cgPath
    }
}
