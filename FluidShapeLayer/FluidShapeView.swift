//
//  FluidShapeView.swift
//  FluidShapeLayer
//
//  Created by bean Milky on 2021/06/28.
//

import UIKit

class FluidShapeView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.drawSecondLayer(rect)
        self.drawFirstLayer(rect)
    }
    
    private func drawFirstLayer(_ rect: CGRect) {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.red.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2
        self.layer.addSublayer(layer)

        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX/5, y: 0))
        path.addCurve(to: CGPoint(x: rect.maxX*2/5, y: rect.maxY),
                      controlPoint1: CGPoint(x: 252, y: 75.5),
                      controlPoint2: CGPoint(x: 155, y: 193))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.close()

        layer.path = path.cgPath
    }
    
    private func drawSecondLayer(_ rect: CGRect) {
        let layer = CAShapeLayer()
        layer.fillColor = UIColor.green.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 5
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 2
        self.layer.addSublayer(layer)

        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX*1/3, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY*1/3),
                          controlPoint: CGPoint(x: rect.midX, y: rect.midY))
        path.close()

        layer.path = path.cgPath
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
