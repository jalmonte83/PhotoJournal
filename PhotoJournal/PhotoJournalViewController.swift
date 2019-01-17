//
//  ViewController.swift
//  PhotoJournal
//
//  Created by Jeffrey Almonte on 1/14/19.
//  Copyright © 2019 Jeffrey Almonte. All rights reserved.
//

import UIKit
import AVFoundation

class PhotoJournalViewController: UIViewController {

    var photoJournal = PhotoJournalModel.getPhotoJournal()
    @IBOutlet weak var photoJournalCollectioView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


}

//extension PhotoJournalViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//    
//}
