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
        let newLayer = CAShapeLayer()
        newLayer.fillColor = UIColor.red.cgColor
        newLayer.strokeColor = UIColor.red.cgColor
        newLayer.shadowOffset = CGSize(width: 0, height: 2)
        newLayer.shadowRadius = 5
        newLayer.shadowColor = UIColor.white.cgColor
        newLayer.shadowOpacity = 0.5
        newLayer.shadowRadius = 2
        self.layer.addSublayer(newLayer)

        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.maxX/5, y: 0))
        path.addCurve(to: CGPoint(x: rect.maxX*2/5, y: rect.maxY),
                      controlPoint1: CGPoint(x: rect.maxX*5/4, y: rect.maxY*1/3),
                      controlPoint2: CGPoint(x: rect.maxX*4/5, y: rect.maxY*9/10))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.close()

        newLayer.path = path.cgPath
        
        let blurEffect = UIBlurEffect(style: .extraLight)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.alpha = 0.7
        visualEffectView.frame = self.bounds
        self.layer.addSublayer(visualEffectView.layer)
    }
    
    private func drawSecondLayer(_ rect: CGRect) {
        let newLayer = CAShapeLayer()
        newLayer.fillColor = UIColor.green.cgColor
        newLayer.strokeColor = UIColor.green.cgColor
        newLayer.shadowOffset = CGSize(width: 0, height: 2)
        newLayer.shadowRadius = 5
        newLayer.shadowColor = UIColor.white.cgColor
        newLayer.shadowOpacity = 0.5
        newLayer.shadowRadius = 2
        self.layer.addSublayer(newLayer)

        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX*1/3, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY*1/3),
                          controlPoint: CGPoint(x: rect.midX, y: rect.midY))
        path.close()

        newLayer.path = path.cgPath
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
