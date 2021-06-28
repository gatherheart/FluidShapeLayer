//
//  FluidShapeView.swift
//  FluidShapeLayer
//
//  Created by bean Milky on 2021/06/28.
//

import UIKit

class FluidShapeView: UIView {

    var effectView: CustomIntensityVisualEffectView?
    override func draw(_ rect: CGRect) {
        self.drawSecondLayer(rect)
        self.drawFirstLayer(rect)
        
        effectView?.removeFromSuperview()
        let blurEffect = UIBlurEffect(style: .extraLight)
        self.effectView = CustomIntensityVisualEffectView(effect: blurEffect, intensity: 0.35)
        effectView?.frame = self.bounds
        addSubview(effectView!)
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

class CustomIntensityVisualEffectView: UIVisualEffectView {

    /// Create visual effect view with given effect and its intensity
    ///
    /// - Parameters:
    ///   - effect: visual effect, eg UIBlurEffect(style: .dark)
    ///   - intensity: custom intensity from 0.0 (no effect) to 1.0 (full effect) using linear scale
    init(effect: UIVisualEffect, intensity: CGFloat) {
        super.init(effect: nil)
        animator = UIViewPropertyAnimator(duration: 1, curve: .linear) { [unowned self] in
            self.effect = effect
        }
        animator.fractionComplete = intensity
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    // MARK: Private
    private var animator: UIViewPropertyAnimator!

}
