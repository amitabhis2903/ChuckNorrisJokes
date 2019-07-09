//
//  Random.swift
//  ChuckNorrisJokes
//
//  Created by A on 09/07/19.
//  Copyright © 2019 A. All rights reserved.
//

import Foundation

struct Random: Decodable {
    let id: String?
    let value: String?
    let categories: [Category]?
}
