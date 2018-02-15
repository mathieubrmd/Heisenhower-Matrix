//
//  SwipingController.swift
//  EisenhowerTodo
//
//  Created by Mathieu Bourmaud on 04/02/2018.
//  Copyright © 2018 Mathieu Bourmaud. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        Page(title: "Important but not urgent", primaryColor: .primaryGreen, secondaryColor: .secondaryGreen, tasks: []),
        Page(title: "Important and urgent", primaryColor: .primaryOrange, secondaryColor: .secondaryOrange, tasks: []),
        Page(title: "Urgent but not important", primaryColor: .primaryPurple, secondaryColor: .secondaryPurple, tasks: []),
        Page(title: "Not important, not urgent", primaryColor: .primaryBlue, secondaryColor: .secondaryBlue, tasks: [])
    ]
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.pageIndicatorTintColor = .gray
        pc.currentPageIndicatorTintColor = pages[pc.currentPage].primaryColor
        return pc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        collectionView?.isPagingEnabled = true
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.backgroundColor = .grayBackground
        self.setStatusBarColor(color: self.pages[pageControl.currentPage].primaryColor)
        setupBottomControls()
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
        pageControl.currentPageIndicatorTintColor = self.pages[pageControl.currentPage].primaryColor
        self.setStatusBarColor(color: self.pages[pageControl.currentPage].primaryColor)
    }
    
    private func setStatusBarColor(color: UIColor) {
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else {
            return
        }
        statusBar.backgroundColor = self.pages[pageControl.currentPage].primaryColor
    }
    
    private func setupBottomControls() {
        let bottomControlsStackView = UIStackView(arrangedSubviews: [pageControl])

        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
}
