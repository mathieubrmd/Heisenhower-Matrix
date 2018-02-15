//
//  PageCell.swift
//  EisenhowerTodo
//
//  Created by Mathieu Bourmaud on 08/02/2018.
//  Copyright © 2018 Mathieu Bourmaud. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            navigationBar.barTintColor = unwrappedPage.primaryColor
            navigationBar.topItem?.title = unwrappedPage.title
            navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        }
    }
    
    private let navigationBar: UINavigationBar = {
        let nB = UINavigationBar()
        nB.items = [UINavigationItem()]
        nB.translatesAutoresizingMaskIntoConstraints = false
        return nB
    }()
    
    public let tableView: UITableView = {
        let tV = UITableView()
        tV.layer.cornerRadius = 10
        tV.backgroundColor = .white
        tV.rowHeight = 64
        tV.layer.shadowOpacity = 0.2
        tV.layer.shadowOffset = CGSize(width: 1, height: 1)
        tV.layer.shadowRadius = 5.0
        tV.layer.shadowColor = UIColor.darkGray.cgColor
        tV.layer.masksToBounds = false
        tV.translatesAutoresizingMaskIntoConstraints = false
        return tV
    }()
    
    private let todoImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "todo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        addSubview(navigationBar)
        addSubview(tableView)
        
        
        navigationBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        navigationBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true

        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        tableView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 24).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -48).isActive = true
        
        /*let topImageContainerView = UIView()
        
        addSubview(topImageContainerView)
        addSubview(descriptionTextView)

        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        topImageContainerView.addSubview(todoImageView)
        
        todoImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        todoImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        todoImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
        todoImageView.widthAnchor.constraint(equalTo: topImageContainerView.widthAnchor, multiplier: 0.6).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true*/
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
