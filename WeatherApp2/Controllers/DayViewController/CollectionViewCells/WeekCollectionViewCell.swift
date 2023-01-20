//
//  WeekCollectionViewCell.swift
//  WeatherApp2
//
//  Created by Agnieszka Juraszek on 04/08/2022.
//

import UIKit

class WeekCollectionViewCell : UICollectionViewCell {
    
    static let reuseIdentifier = "WeekCollectionViewCell"
    
    let viewController: WeekViewController
    
    override init(frame: CGRect) {
        viewController = WeekViewController()
        super.init(frame: frame)
        setupViewController()
    }
    
    required init?(coder aDecoder: NSCoder) {
        viewController = WeekViewController()
        super.init(coder: aDecoder)
        setupViewController()
    }
    
    private func setupViewController() {
        viewController.view.backgroundColor = .green
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
