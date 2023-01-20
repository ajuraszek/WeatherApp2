//
//  NowCollectionViewCell.swift
//  WeatherApp2
//
//  Created by Agnieszka Juraszek on 04/08/2022.
//

import UIKit

class NowCollectionViewCell : UICollectionViewCell {
    
    static let reuseIdentifier = "NowCollectionViewCell"
    
    let viewController: NowViewController
    
    override init(frame: CGRect) {
        viewController = NowViewController()
        super.init(frame: frame)
        setupViewController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewController = NowViewController()
        super.init(coder: aDecoder)
        setupViewController()
    }
    
    private func setupViewController() {
        viewController.view.backgroundColor = .orange
        contentView.addSubview(viewController.view)
        if let view = viewController.view {
            view.translatesAutoresizingMaskIntoConstraints = false
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0.0).isActive = true
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0.0).isActive = true
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0.0).isActive = true
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0.0).isActive = true
        }
    }
}

