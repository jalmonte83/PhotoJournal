//
//  PhotoJournalDetailController.swift
//  PhotoJournal
//
//  Created by Jeffrey Almonte on 1/16/19.
//  Copyright © 2019 Jeffrey Almonte. All rights reserved.
//

import UIKit

class PhotoJournalDetailController: UIViewController {
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var photoJournalDetailImage: UIImageView!
    @IBOutlet weak var photoJournalDetailDescription: UITextView!
    
    private var photoLibraryViewController: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
photoLibraryViewController = UIImagePickerController()
        photoLibraryViewController.delegate = self
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            cameraButton.isEnabled = false
        }
    }
    private func showPhotoLibraryViewController() {
        present(photoLibraryViewController
            , animated:  true, completion: nil)
    }
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
      //  photoLibraryViewController.sourceType = .camera
      //  showPhotoLibraryViewController()
     
    }
    @IBAction func PhotoLibraryPressed(_ sender: UIBarButtonItem) {
      //  photoLibraryViewController.sourceType = .photoLibrary
       // showPhotoLibraryViewController()
        present(photoLibraryViewController
            , animated:  true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        let data = photoJournalDetailImage.image?.jpegData(compressionQuality: 50)
        let date = Date()
        let isoDataFormatter = ISO8601DateFormatter()
        isoDataFormatter.formatOptions = [.withFullDate,
                                          .withFullTime,
                                          .withTimeZone,
                                          .withDashSeparatorInDate]
        let timeStamp = isoDataFormatter.string(from: date)
        guard let photoJournalDetailDescription = photoJournalDetailDescription.text else { fatalError("Description nil")}
        let stored = PhotoJournal.init(createdAt: timeStamp, imageData: data!, description: photoJournalDetailDescription)
        PhotoJournalModel.addPhotoJournal(photoPost: stored)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension PhotoJournalDetailController: UINavigationControllerDelegate,UIImagePickerControllerDelegate{
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            dismiss(animated: true, completion: nil)
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                photoJournalDetailImage.image = image
            } else {
                print("Original Image is nil")
            }
            dismiss(animated: true, completion: nil)
        }
        
    }
