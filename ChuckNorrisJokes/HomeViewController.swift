//
//  HomeViewController.swift
//  ChuckNorrisJokes
//
//  Created by A on 08/07/19.
//  Copyright © 2019 A. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController {
    
    
    let categories: [DataModel] = [DataModel(image: #imageLiteral(resourceName: "animals"), name: "animal"), DataModel(image: #imageLiteral(resourceName: "animals"), name: "career"), DataModel(image: #imageLiteral(resourceName: "animals"), name: "celebrity"), DataModel(image: #imageLiteral(resourceName: "animals"), name: "dev"), DataModel(image: #imageLiteral(resourceName: "animals"), name: "explicit"),DataModel(image: #imageLiteral(resourceName: "animals"), name: "fashion"),DataModel(image: #imageLiteral(resourceName: "animals"), name: "food"),DataModel(image: #imageLiteral(resourceName: "animals"), name: "history"),DataModel(image: #imageLiteral(resourceName: "animals"), name: "money"),DataModel(image: #imageLiteral(resourceName: "animals"), name: "movie"),DataModel(image: #imageLiteral(resourceName: "animals"), name: "music"),DataModel(image: #imageLiteral(resourceName: "animals"), name: "political"),DataModel(image: #imageLiteral(resourceName: "animals"), name: "religion"),DataModel(image: #imageLiteral(resourceName: "animals"), name: "science"),DataModel(image: #imageLiteral(resourceName: "animals"), name: "sport"),DataModel(image: #imageLiteral(resourceName: "animals"), name: "travel")]
    
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        setupNavBar()
    }
    
    
    @objc func getRandomJokes() {
        let randomJokeVC = self.storyboard?.instantiateViewController(withIdentifier: "RandomJokeViewController") as? RandomJokeViewController
        self.navigationController?.pushViewController(randomJokeVC!, animated: true)
        
    }
    
    fileprivate func setupNavBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Categories"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        let randomJokeBarButtonItem = UIBarButtonItem(title: "Random Joke", style: .done, target: self, action: #selector(getRandomJokes))
        navigationItem.rightBarButtonItem  = randomJokeBarButtonItem
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! CategoryCollectionViewCell
        cell.configure(with: categories[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categVc = self.storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        categVc.category = categories[indexPath.row].name
        self.navigationController?.pushViewController(categVc, animated: true)
    }
}


extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
}
