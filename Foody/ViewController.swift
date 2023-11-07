//
//  ViewController.swift
//  Foody
//
//  Created by Haldox on 07/11/2023.
//

import UIKit
import CoreML
import Vision
import Photos
import PhotosUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        // Launch Camera
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = userPickedImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        
        // Present the imagepicket to the user
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    
}


/*

// MARK: - PHPicker Configurations (PHPickerViewControllerDelegate)

// Use this class to access the User photolibray
extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
         picker.dismiss(animated: true, completion: .none)
         results.forEach { result in
               result.itemProvider.loadObject(ofClass: UIImage.self) { reading, error in
               guard let image = reading as? UIImage, error == nil else { return }
               DispatchQueue.main.async {
                   self.imageView.image = image
                   // TODO: - Here you get UIImage
               }
               result.itemProvider.loadFileRepresentation(forTypeIdentifier: "public.image") { [weak self] url, _ in
                // TODO: - Here You Get The URL
               }
          }
       }
  }

   /// call this method for `PHPicker`
   func openPHPicker() {
       var phPickerConfig = PHPickerConfiguration(photoLibrary: .shared())
       phPickerConfig.selectionLimit = 1
       phPickerConfig.filter = PHPickerFilter.any(of: [.images, .livePhotos])
       let phPickerVC = PHPickerViewController(configuration: phPickerConfig)
       phPickerVC.delegate = self
       present(phPickerVC, animated: true)
   }
}

*/
