//
//  RandomJokeViewController.swift
//  ChuckNorrisJokes
//
//  Created by A on 09/07/19.
//  Copyright © 2019 A. All rights reserved.
//

import UIKit

class RandomJokeViewController: UIViewController {

    
    
    @IBOutlet weak var jokeLbl: UILabel!
    
    var random: Random?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRandomJokes()
        setupNavBar()
       
        // Do any additional setup after loading the view.
    }

    
    fileprivate func getRandomJokes() {
        
        Service.shared.fetchGenericData(urlString: RANDOM_URL) { (random: Random?) in
            
            //print("Data: \(random)")
            
            DispatchQueue.main.async {
                self.random = random
                self.jokeLbl.textColor = UIColor.random
                self.jokeLbl.text = random?.value
            }
            
            
        }
    }
    
    fileprivate func setupNavBar() {
        self.navigationController?.navigationBar.isHidden = false
        let refreshBarButtonItem = UIBarButtonItem(title: "Refresh Joke", style: .done, target: self, action: #selector(getNewJokes))
        self.navigationItem.rightBarButtonItem  = refreshBarButtonItem
        
    }

    @objc func getNewJokes() {
        self.getRandomJokes()
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
