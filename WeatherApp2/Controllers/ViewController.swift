//
//  ViewController.swift
//  WeatherApp2
//
//  Created by Agnieszka Juraszek on 14/07/2022.
//

import UIKit

class ViewController: UIViewController {

    enum RootViewType: Int, CaseIterable {
        case now
        case day
        case week
    }
    
    private let dataManager = DataManager(baseURL: API.basicForecastDejMnieTuTeraz)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()

        // Fetch Weather Data
        dataManager.weatherDataForLocation(latitude: Defaults.latitude, longitude: Defaults.longitude) { (response, error) in
            print(response ?? "default value")
        }
    }
    
    @IBOutlet var collectionView: UICollectionView!
    
    private func setupView() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.register(NowCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: NowCollectionViewCell.reuseIdentifier)
        collectionView.register(DayCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: DayCollectionViewCell.reuseIdentifier)
        collectionView.register(WeekCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: WeekCollectionViewCell.reuseIdentifier)
    }

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RootViewType.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let type = RootViewType(rawValue: indexPath.item) else {
            fatalError()
        }
        
        switch type {
        case .day:
            return collectionView.dequeueReusableCell(withReuseIdentifier: DayCollectionViewCell.reuseIdentifier, for: indexPath)
        case .now:
            return collectionView.dequeueReusableCell(withReuseIdentifier: NowCollectionViewCell.reuseIdentifier, for: indexPath)
        case .week:
            return collectionView.dequeueReusableCell(withReuseIdentifier: WeekCollectionViewCell.reuseIdentifier, for: indexPath)
        }
    }

}



