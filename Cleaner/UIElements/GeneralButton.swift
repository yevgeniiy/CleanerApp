//
//  GeneralButton.swift
//  Cleaner
//
//  Created by Yevgenii Kryzhanivskyi on 23.08.2022.
//

import UIKit

final class GeneralButton: ButtonBaseClass {
    
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
        label.font = UIFont(name: "Roboto-Regular", size: 13)
        label.textColor = color
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(image:UIImage?, title:String) {
        super.init(frame: .zero)
        
        imageView.image = image
        addSubview(imageView)
        
        titleLabel.text = title
        addSubview(titleLabel)
        
        setConstraints()
    }
    
    private func setConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
}
