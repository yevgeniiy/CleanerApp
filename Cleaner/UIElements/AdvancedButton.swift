//
//  AdvancedButton.swift
//  Cleaner
//
//  Created by Yevgenii Kryzhanivskyi on 23.08.2022.
//

import UIKit

final class InfoButton: ButtonBaseClass {
    
    private let color: UIColor = UIColor(named: "AccentColor") ?? .purple
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = color
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Regular", size: 10)
        label.textColor = color
        return label
    }()
    
    lazy var topFootnoteLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto-Medium", size: 13)
        label.textColor = UIColor.white
        return label
    }()
    
    lazy var BottomFootnoteLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.00)
        label.font = UIFont(name: "Roboto-Regular", size: 8)
        return label
    }()
    
    private lazy var centralImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = color
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var circleLayer: CAShapeLayer = {
        let circle = CAShapeLayer()
        circle.fillColor = UIColor.white.cgColor
        return circle
    }()
    
    private lazy var shapeLayer: CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = color.cgColor
        shapeLayer.opacity = 0.76
        return shapeLayer
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(image:UIImage?, title:String, topFootnote:String, bottomFootnote:String) {
        super.init(frame: .zero)
        setBackground()
        
        imageView.image = image
        addSubview(imageView)
        
        titleLabel.text = title
        addSubview(titleLabel)
        
        topFootnoteLabel.text = topFootnote
        addSubview(topFootnoteLabel)
        
        BottomFootnoteLabel.text = bottomFootnote
        addSubview(BottomFootnoteLabel)
        
        setConstraints()
    }
    
    
    private func setBackground() {
        layer.addSublayer(shapeLayer)
        layer.addSublayer(circleLayer)
        
        addSubview(centralImage)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let radius = bounds.height/2
        layer.cornerRadius = radius
        
        // Button background
        let path = CGMutablePath()
        path.move(to: CGPoint(x: radius, y: radius))
        path.addArc(center: CGPoint(x: radius, y: radius),
                    radius: radius,
                    startAngle: (13 * .pi / 180), endAngle: (167 * .pi / 180),
                    clockwise: false)
        
        shapeLayer.path = path
        
        let circleRadius = bounds.height / 9.25
        circleLayer.path = UIBezierPath(roundedRect: CGRect(x: radius - circleRadius, y: radius - circleRadius + 2, width: 2 * circleRadius, height: 2 * circleRadius), cornerRadius: circleRadius).cgPath
        
    }
    
    private func setConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: centralImage.heightAnchor).isActive = true
        
        centralImage.translatesAutoresizingMaskIntoConstraints = false
        centralImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 5).isActive = true
        centralImage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        topFootnoteLabel.translatesAutoresizingMaskIntoConstraints = false
        topFootnoteLabel.topAnchor.constraint(equalTo: centralImage.bottomAnchor, constant: 5).isActive = true
        topFootnoteLabel.bottomAnchor.constraint(equalTo: BottomFootnoteLabel.topAnchor).isActive = true
        topFootnoteLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        BottomFootnoteLabel.translatesAutoresizingMaskIntoConstraints = false
        BottomFootnoteLabel.topAnchor.constraint(equalTo: topFootnoteLabel.bottomAnchor).isActive = true
        BottomFootnoteLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6).isActive = true
        BottomFootnoteLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        BottomFootnoteLabel.heightAnchor.constraint(equalTo: centralImage.heightAnchor).isActive = true
    }
}
