//
//  PhotoJournal.swift
//  PhotoJournal
//
//  Created by Jeffrey Almonte on 1/14/19.
//  Copyright © 2019 Jeffrey Almonte. All rights reserved.
//

import Foundation

struct PhotoJournal: Codable {
    let createdAt: String
    let imageData: Data
    let description: String
}
