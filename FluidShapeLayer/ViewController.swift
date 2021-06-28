//
//  ViewController.swift
//  FluidShapeLayer
//
//  Created by bean Milky on 2021/06/28.
//

import UIKit

class ViewController: UIViewController {
    let fluidView = FluidShapeView(frame: CGRect.zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setFluidView()
    }
    
    func setFluidView() {
        self.view.addSubview(fluidView)
        self.fluidView.translatesAutoresizingMaskIntoConstraints = false
        self.fluidView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.fluidView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        self.fluidView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.fluidView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }

}

