//
//  ViewController.swift
//  PhotoJournal
//
//  Created by Jeffrey Almonte on 1/14/19.
//  Copyright © 2019 Jeffrey Almonte. All rights reserved.
//

import UIKit


class PhotoJournalViewController: UIViewController {
    
    var photoJournal = PhotoJournalModel.getPhotoJournal(){
        didSet {
            photoJournalCollectioView.reloadData()
        }

    }
    
    @IBOutlet weak var photoJournalCollectioView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoJournalCollectioView.delegate = self
        photoJournalCollectioView.dataSource = self
        print(DataPersistenceManager.documentsDirectory())
        
    }
    override func viewWillAppear(_ animated: Bool) {
        photoJournalCollectioView.reloadData()
    }

}

extension PhotoJournalViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoJournalModel.getPhotoJournal().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoJournalCell", for: indexPath) as? PhotoJournalCollectionViewCell else { return UICollectionViewCell() }
        let photoToSet = PhotoJournalModel.getPhotoJournal()[indexPath.row]
        cell.PhotoJournalImage.image = UIImage(data: photoToSet.imageData)
        cell.photoJournalDescription.text = photoToSet.description
        cell.descriptionDate.text = photoToSet.dateFormattedString
        cell.optionsButton.tag = indexPath.row
        return cell
    }
    
    
}
extension PhotoJournalViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 400, height: 400)
    }
}
