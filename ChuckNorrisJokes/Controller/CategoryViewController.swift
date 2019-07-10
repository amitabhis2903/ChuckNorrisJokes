//
//  CategoryViewController.swift
//  ChuckNorrisJokes
//
//  Created by A on 10/07/19.
//  Copyright © 2019 A. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    
    //UIView to containerView
    let containerView: ViewDesgin = {
        let view = ViewDesgin()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    //UILabel to dispayJoke
    let displayTxt: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.random
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    
    var category: String = ""
    var dataJokes: Random?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(containerView)
        containerView.addSubview(displayTxt)
        view.setGradientBackground(colorOne: Color.darkGray, colorTwo: Color.green)
        setupConstraint()
        setupNavBar()
        getJokes()
    }
    

    
    fileprivate func setupConstraint() {
    
        //ContainerView Constraint
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 350).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        //DisplayTxt Constraint
        displayTxt.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        
        displayTxt.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        
        displayTxt.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        
        displayTxt.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    fileprivate func setupNavBar() {
        self.navigationController?.navigationBar.isHidden = false
        let refreshBarButtonItem = UIBarButtonItem(title: "Refresh Joke", style: .done, target: self, action: #selector(getNewJokes))
        self.navigationItem.rightBarButtonItem  = refreshBarButtonItem
    }
    
    @objc func getNewJokes() {
        self.getJokes()
    }
    
    
    func getJokes() {
        let urlString = "https://api.chucknorris.io/jokes/random?category=\(category)"
        Service.shared.fetchGenericData(urlString: urlString) { (random: Random?) in
            DispatchQueue.main.async {
                self.dataJokes = random
                self.displayTxt.textColor = UIColor.random
                self.displayTxt.text = random?.value
            }
        }
    }
}
