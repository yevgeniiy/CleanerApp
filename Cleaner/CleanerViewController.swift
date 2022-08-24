//
//  CleanerViewController.swift
//  Cleaner
//
//  Created by Yevgenii Kryzhanivskyi on 23.08.2022.
//


import UIKit

class CleanerViewController: UIViewController {
    
    private let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: UIScreen.main.bounds)
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let infoContainer = UIView()
    
    lazy var infoLabel: InfoLabel = {
        let label = InfoLabel()
        label.totalMemory.text = "128 GB"
        label.availableMemory.text = "24 GB"
        label.trashSize.text = "470 MB"
        label.percentage.text = "78%"
        
        return label
    }()
    
    var btnDublPhotos = InfoButton(image: UIImage(named: "photos"),
                                   title: "Dublicate photos",
                                   topFootnote: "120 files",
                                   bottomFootnote: "20 duplicate")
    
    var btnDublScreenshots = InfoButton(image: UIImage(named: "screenshots"),
                                        title: "Dublicate screenshots",
                                        topFootnote: "12 files",
                                        bottomFootnote: "2 duplicate")
    
    var btnDublContacts = InfoButton(image: UIImage(named: "contacts"),
                                     title: "Dublicate contacts",
                                     topFootnote: "30 contacts",
                                     bottomFootnote: "7 duplicate")
    
    var btnSecretStorage = GeneralButton(image: UIImage(named: "fingerprint"),
                                         title: "SECRET\nSTORAGE")
    
    var btnAllPhotos = GeneralButton(image: UIImage(named: "photo"),
                                     title: "ALL\nPHOTOS")
    
    var btnAllVideos = GeneralButton(image: UIImage(named: "video"),
                                     title: "ALL\nVIDEOS")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        view.insertSubview(backgroundImage, at: 0)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: logo)
        infoContainer.addSubview(infoLabel)
        
        let subViews = [infoContainer, btnDublPhotos, btnDublScreenshots, btnDublContacts, btnAllPhotos, btnAllVideos, btnSecretStorage]
        for subView in subViews {
            view.addSubview(subView)
        }
        setConstraints()
    }
    
    func setConstraints() {
        let guide = view.safeAreaLayoutGuide
        
        btnDublPhotos.translatesAutoresizingMaskIntoConstraints = false
        btnDublPhotos.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        btnDublPhotos.topAnchor.constraint(equalTo: btnDublScreenshots.centerYAnchor).isActive = true
        btnDublPhotos.heightAnchor.constraint(equalToConstant: 111).isActive = true
        btnDublPhotos.widthAnchor.constraint(equalTo: btnDublPhotos.heightAnchor).isActive = true
        
        btnDublScreenshots.translatesAutoresizingMaskIntoConstraints = false
        btnDublScreenshots.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnDublScreenshots.bottomAnchor.constraint(equalTo: btnSecretStorage.topAnchor, constant: -10).isActive = true
        btnDublScreenshots.heightAnchor.constraint(equalTo: btnDublPhotos.heightAnchor).isActive = true
        btnDublScreenshots.widthAnchor.constraint(equalTo: btnDublScreenshots.heightAnchor).isActive = true
        
        btnDublContacts.translatesAutoresizingMaskIntoConstraints = false
        btnDublContacts.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        btnDublContacts.centerYAnchor.constraint(equalTo: btnDublPhotos.centerYAnchor).isActive = true
        btnDublContacts.heightAnchor.constraint(equalTo: btnDublPhotos.heightAnchor).isActive = true
        btnDublContacts.widthAnchor.constraint(equalTo: btnDublContacts.heightAnchor).isActive = true
        
        btnSecretStorage.translatesAutoresizingMaskIntoConstraints = false
        btnSecretStorage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnSecretStorage.bottomAnchor.constraint(equalTo: btnAllPhotos.topAnchor).isActive = true
        btnSecretStorage.heightAnchor.constraint(equalTo: btnDublPhotos.heightAnchor).isActive = true
        btnSecretStorage.widthAnchor.constraint(equalTo: btnDublContacts.heightAnchor).isActive = true
        
        btnAllPhotos.translatesAutoresizingMaskIntoConstraints = false
        btnAllPhotos.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -12).isActive = true
        btnAllPhotos.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20).isActive = true
        btnAllPhotos.heightAnchor.constraint(equalTo: btnDublPhotos.heightAnchor).isActive = true
        btnAllPhotos.widthAnchor.constraint(equalTo: btnDublContacts.heightAnchor).isActive = true
        
        btnAllVideos.translatesAutoresizingMaskIntoConstraints = false
        btnAllVideos.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 12).isActive = true
        btnAllVideos.bottomAnchor.constraint(equalTo: btnAllPhotos.bottomAnchor).isActive = true
        btnAllVideos.heightAnchor.constraint(equalTo: btnDublPhotos.heightAnchor).isActive = true
        btnAllVideos.widthAnchor.constraint(equalTo: btnDublContacts.heightAnchor).isActive = true
        
        infoContainer.translatesAutoresizingMaskIntoConstraints = false
        infoContainer.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        infoContainer.bottomAnchor.constraint(equalTo: btnDublScreenshots.topAnchor).isActive = true
        infoContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        infoContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        infoLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        infoLabel.centerXAnchor.constraint(equalTo: infoContainer.centerXAnchor).isActive = true
        infoLabel.centerYAnchor.constraint(equalTo: infoContainer.centerYAnchor).isActive = true
    }
}

