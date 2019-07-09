//
//  HomeViewController.swift
//  ChuckNorrisJokes
//
//  Created by A on 08/07/19.
//  Copyright © 2019 A. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Categories"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        let randomJokeBarButtonItem = UIBarButtonItem(title: "Random Joke", style: .done, target: self, action: #selector(getRandomJokes))
        navigationItem.rightBarButtonItem  = randomJokeBarButtonItem
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func getRandomJokes() {
                let randomJokeVC = self.storyboard?.instantiateViewController(withIdentifier: "RandomJokeViewController") as? RandomJokeViewController
                self.navigationController?.pushViewController(randomJokeVC!, animated: true)
        
        }
    
    
    
}
