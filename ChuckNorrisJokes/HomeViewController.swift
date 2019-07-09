//
//  HomeViewController.swift
//  ChuckNorrisJokes
//
//  Created by A on 08/07/19.
//  Copyright © 2019 A. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var random: Random?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Categories"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        let logoutBarButtonItem = UIBarButtonItem(title: "Random Joke", style: .done, target: self, action: #selector(getRandomJokes))
        navigationItem.rightBarButtonItem  = logoutBarButtonItem
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func getRandomJokes() {
        
        
        Service.shared.fetchRandom_Joke { (random, err) in
            
            
            if let err = err {
                print("Failed to fetch category:", err)
                return
            }
            
            print("Data: \(random!)")
            
            self.random = random
            
            DispatchQueue.main.async {
                let randomJokeVC = self.storyboard?.instantiateViewController(withIdentifier: "RandomJokeViewController") as? RandomJokeViewController
                self.navigationController?.pushViewController(randomJokeVC!, animated: true)            }
            
        }
    }
}
