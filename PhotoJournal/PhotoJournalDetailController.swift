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
    private var photoLibraryViewController: UIImagePickerController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    private func showPhotoLibraryViewController() {
        present(photoLibraryViewController
            , animated:  true, completion: nil)
    }
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        photoLibraryViewController.sourceType = .camera
        showPhotoLibraryViewController()
    }
    @IBAction func PhotoLibraryPressed(_ sender: UIBarButtonItem) {
        photoLibraryViewController.sourceType = .photoLibrary
        showPhotoLibraryViewController()
    }
    @IBAction func saveButtonPressed(_ sender: Any) {
        
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
