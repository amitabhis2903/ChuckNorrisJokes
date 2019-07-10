//
//  CategoryCollectionViewCell.swift
//  ChuckNorrisJokes
//
//  Created by A on 09/07/19.
//  Copyright © 2019 A. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    
    
    //Container View
    let containerView: ViewDesgin = {
        let view = ViewDesgin()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    //Image View
    let thumbnail: UIImageView = {
        let imageView = UIImageView()
        //imageView.backgroundColor = .blue
        imageView.image = #imageLiteral(resourceName: "animals")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    //Label
    let imageLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hello"
        lbl.textColor = UIColor.random
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView()  {
        addSubview(containerView)
        containerView.addSubview(thumbnail)
        containerView.addSubview(imageLabel)
        //thumbnail.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        setupConstraint()
    }
    
    public func configure(with model: DataModel) {
        thumbnail.image = model.image
        imageLabel.text = model.name
    }
    
   fileprivate func setupConstraint() {
        
        //Container View Constraint
        
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        //Image Constraint
        thumbnail.leftAnchor.constraint(equalTo: self.containerView.leftAnchor).isActive = true
        thumbnail.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        thumbnail.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        thumbnail.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        //Image Lable Constraint
        imageLabel.leftAnchor.constraint(equalTo: self.containerView.leftAnchor).isActive = true
        imageLabel.rightAnchor.constraint(equalTo: self.containerView.rightAnchor).isActive = true
        imageLabel.topAnchor.constraint(equalTo: self.thumbnail.bottomAnchor, constant: 5).isActive = true
        imageLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
