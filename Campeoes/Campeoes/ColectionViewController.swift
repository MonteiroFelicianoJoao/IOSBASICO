//
//  ColectionViewController.swift
//  Campeoes
//
//  Created by aluno on 07/07/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

class ColectionViewController: UIViewController {
    
    let reuseIdentifier = "cell"
    
    
    var worldCups: [WorldCup] = []
    var countrys: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCoutrys()
        
    }
    
    func loadCoutrys() {
        let fileURL = Bundle.main.url(forResource: "winners", withExtension: ".json")!
        let jsonData = try! Data(contentsOf: fileURL)
        
        do {
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
            for worldCup in worldCups {
                for game in worldCup.matches[0].games {
                    let countryHome = game.home
                    let countryAway = game.away
                    if !countrys.contains(countryHome) {
                    countrys.append(countryHome)
                    }
                    if !countrys.contains(countryAway) {
                    countrys.append(countryAway)
                    }
                }
            }
        } catch  {
            print(error.localizedDescription)
        }
    }
    
}

extension ColectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.countrys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            // get a reference to our storyboard cell
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! CupCollectionViewCell
            
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.myLabel.text = self.countrys[indexPath.item]
            //cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        cell.countryFlag.image = UIImage(named: self.countrys[indexPath.item])
            return cell
        }
}


