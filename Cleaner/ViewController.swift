//
//  ViewController.swift
//  Cleaner
//
//  Created by Yevgenii Kryzhanivskyi on 23.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let backImage = UIImage(named: "backButton")
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var btnCleaner = GeneralButton(image: UIImage(systemName: "rectangle.portrait.and.arrow.right"),
                                        title: "CLEANER")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        btnCleaner.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        let vc = CleanerViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupView() {
        view.insertSubview(backgroundImage, at: 0)
        setupBackButton()
        
        view.addSubview(btnCleaner)
        setConstraints()
    }
    
    func setupBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        backButton.tintColor = .white
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
    }
    
    func setConstraints() {
        btnCleaner.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            btnCleaner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnCleaner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btnCleaner.heightAnchor.constraint(equalToConstant: 111),
            btnCleaner.widthAnchor.constraint(equalTo: btnCleaner.heightAnchor),
        ])
    }
    
}


