//
//  InfoLabel.swift
//  Cleaner
//
//  Created by Yevgenii Kryzhanivskyi on 23.08.2022.
//

import UIKit

class InfoLabel: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Your Storage"
        label.font = UIFont(name: "Roboto-Regular", size: 18)
        label.textColor = .white
        return label
    }()
    
    lazy var percentage: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "--%"
        label.font = UIFont(name: "Roboto-Regular", size: 57)
        label.textColor = .white
        return label
    }()
    
    lazy var totalMemory: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "-- GB"
        label.font = UIFont(name: "Roboto-Medium", size: 11)
        label.textColor = .white
        return label
    }()
    
    lazy var availableMemory: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "-- GB"
        label.font = UIFont(name: "Roboto-Medium", size: 11)
        label.textColor = .white
        return label
    }()
    
    lazy var trashSize: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "-- MB"
        label.font = UIFont(name: "Roboto-Medium", size: 11)
        label.textColor = .white
        return label
    }()
    
    private lazy var totalMemoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "Total storage:"
        label.font = UIFont(name: "Roboto-Regular", size: 11)
        label.textColor = .white
        return label
    }()
    
    private lazy var availableMemoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "Available:"
        label.font = UIFont(name: "Roboto-Regular", size: 11)
        label.textColor = .white
        return label
    }()
    
    private lazy var trashSizeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = "Trash size:"
        label.font = UIFont(name: "Roboto-Regular", size: 11)
        label.textColor = .white
        return label
    }()
    
    private lazy var labelsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [totalMemoryLabel, availableMemoryLabel, trashSizeLabel])
        stack.axis = .vertical
        stack.alignment = .trailing
        stack.spacing = 5
        return stack
    }()
    
    private lazy var qtyStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [totalMemory, availableMemory, trashSize])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = labelsStack.spacing
        return stack
    }()
    
    private lazy var horizontalStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [labelsStack, qtyStack])
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = UIColor.white.withAlphaComponent(0.15)
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1

        addSubview(titleLabel)
        addSubview(percentage)
        addSubview(horizontalStack)
        
        setConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height/2
    }
    
    private func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        
        percentage.translatesAutoresizingMaskIntoConstraints = false
        percentage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6).isActive = true
        percentage.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        horizontalStack.topAnchor.constraint(equalTo: percentage.bottomAnchor).isActive = true
    }
    
}
