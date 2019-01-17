//
//  PhotoJournalModel.swift
//  PhotoJournal
//
//  Created by Jeffrey Almonte on 1/14/19.
//  Copyright © 2019 Jeffrey Almonte. All rights reserved.
//

import Foundation

final class PhotoJournalModel {
    static let filename = "PhotoJournalList.plist"
    private static var photos = [PhotoJournal]()
    private static var photoJournal = [PhotoJournal]()
    private init() {}
    
    static func savePhotoJournal() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(photoJournal)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    static func getPhotoJournal() -> [PhotoJournal] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
       // var photoJournal: PhotoJournal?
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    photoJournal = try PropertyListDecoder().decode([PhotoJournal].self, from: data)
                } catch {
                    print("property list error: \(error)")
                }
                
            } else {
                print("getPhotoJournal: data is nil")
            }
        } else {
            print("file does not exist")
        }
        photoJournal = photoJournal.sorted {$0.date > $1.date}
        
        return photoJournal
        
    }
//    static func addPhotoJournal() {
//        photoJournal.append(photo)
//    }
    static func editPhotoJournal(photoJournal: PhotoJournal, index: Int) {
        self.photoJournal.remove(at: index)
        self.savePhotoJournal()
    }
}

//final class PhotoJournalModel {
//    static let filename = "PhotoList.plist"
//    private static var photos = [PhotoJournal]()
//    private static var photoJournal = [PhotoJournal]()
//
//    private init() {}
//
//    static func savePhotoJournal() {
//        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
//        do {
//            let data = try PropertyListEncoder().encode(photoJournal)
//            try data.write(to: path, options: Data.WritingOptions.atomic)
//        } catch {
//            print("property list encoding error")
//        }
//    }
//
//    static func getPhotoJournal() -> [PhotoJournal] {
//        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
//        if FileManager.default.fileExists(atPath: path) {
//            if let data = FileManager.default.contents(atPath: path) {
//                do {
//                    photoJournal = try PropertyListDecoder().decode([PhotoJournal].self, from: data)
//                } catch {
//                    print("getPhotoJournal - property list decoding error")
//                }
//            } else {
//                print("getPhotoJournal - data is nil")
//            }
//        } else {
//            print("getPhotoJournal - \(filename) does not exist")
//        }
//        photoJournal = photoJournal.sorted {$0.date > $1.date}
//        return photoJournal
//    }
//
//    static func addPhotoJournal(photoPost: PhotoJournal) {
//        photoJournal.append(photoPost)
//        savePhotoJournal()
//    }
//
//    static func deletePhotoJournal(photoJournal: PhotoJournal, index: Int) {
//        self.photoJournal.remove(at: index)
//        savePhotoJournal()
//    }
//
//    static func editPhotoJournal(photoJournal: PhotoJournal, index: Int) {
//        self.photoJournal.remove(at: index)
//        self.photoJournal.insert(photoJournal, at: index)
//        savePhotoJournal()
//    }
//
//}
