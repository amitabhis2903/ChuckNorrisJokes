//
//  Service.swift
//  ChuckNorrisJokes
//
//  Created by A on 09/07/19.
//  Copyright © 2019 A. All rights reserved.
//


enum ServiceError: Error {
    case badURL
    case noData
}


import Foundation

class Service: NSObject {
    static let shared = Service()
    
    private override init() {
    }
    
    func fetchRandom_Joke(completion: @escaping (Random?, ServiceError?) -> ()) {
        
        let urlString = "https://api.chucknorris.io/jokes/random"
        guard let url = URL(string: urlString) else {
            completion(nil, .badURL)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            
            if let err = error {
                completion(nil, .noData)
                print("Failed to fetch data ", err)
                return
            }
            
            
            //Check response
            guard let data = data else {
                completion(nil, .noData)
                return
            }
            
            do {
                
                let category = try JSONDecoder().decode(Random.self, from: data)
                DispatchQueue.main.async {
                    completion(category, nil)
                }
                
                
            }catch let err {
                print("Failed to decode : \(err.localizedDescription)")
            }
            
        }.resume()
        
    }
}
