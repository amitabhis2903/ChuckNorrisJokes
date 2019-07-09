//
//  ViewController.swift
//  ChuckNorrisJokes
//
//  Created by A on 08/07/19.
//  Copyright © 2019 A. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func fbBtn(_ sender: Any) {
        
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        navigationController?.pushViewController(homeVC!, animated: true)
    }
    
}

