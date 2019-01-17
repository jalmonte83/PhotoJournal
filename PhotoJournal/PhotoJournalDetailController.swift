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
    @IBAction func PhotoLibraryPressed(_ sender: UIBarButtonItem) {
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
