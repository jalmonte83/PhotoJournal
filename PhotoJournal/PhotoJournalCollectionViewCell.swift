//
//  PhotoJournalCollectionViewCell.swift
//  PhotoJournal
//
//  Created by Jeffrey Almonte on 1/16/19.
//  Copyright © 2019 Jeffrey Almonte. All rights reserved.
//

import UIKit

class PhotoJournalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var PhotoJournalImage: UIImageView!
    @IBOutlet weak var photoJournalDescription: UILabel!
    @IBOutlet weak var descriptionDate: UILabel!
    @IBOutlet weak var optionsButton: UIButton!
    @IBAction func optionsButtonPressed(_ sender: UIButton) {
    }
}
