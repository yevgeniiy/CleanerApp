//
//  ButtonBaseClass.swift
//  Cleaner
//
//  Created by Yevgenii Kryzhanivskyi on 23.08.2022.
//

import UIKit

class ButtonBaseClass: UIControl {
    
    private var innerShadow:CALayer = {
        let innerShadow = CALayer()
        innerShadow.masksToBounds = true
        
        // Shadow properties
        innerShadow.name = "InnerShadow"
        innerShadow.shadowColor = UIColor.black.cgColor
        innerShadow.shadowOffset = CGSize(width: 0, height: 0)
        innerShadow.shadowOpacity = 0.56
        innerShadow.shadowRadius = 4
        return innerShadow
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addShadow(offset: CGSize(width: 0, height: 4), color: UIColor.black, radius: 2, opacity: 0.3)
        addInnerShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius = bounds.height/2
        layer.cornerRadius = radius
        
        // Inner shadow
        innerShadow.frame = bounds
        let innerShadowPath = UIBezierPath(roundedRect: bounds.insetBy(dx: 2, dy:2), cornerRadius:radius)
        let innerShadowCutout = UIBezierPath(roundedRect: bounds, cornerRadius: radius).reversing()
        
        innerShadowPath.append(innerShadowCutout)
        innerShadow.shadowPath = innerShadowPath.cgPath
        innerShadow.cornerRadius = radius
        
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                highlight()
            } else {
                unHighlight()
            }
        }
    }
    
    private func highlight() {
        removeInnerShadow()
        layer.shadowOpacity = 0
    }
    
    private func unHighlight() {
        addInnerShadow()
        layer.shadowOpacity = 0.3
    }
    
    private func removeInnerShadow() {
        layer.sublayers?.first { $0.name == "InnerShadow" }?.removeFromSuperlayer()
    }
    
    private func addInnerShadow() {
        self.layer.addSublayer(innerShadow)
    }
}
