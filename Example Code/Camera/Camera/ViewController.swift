//
//  ViewController.swift
//  Camera
//
//  Created by Mike Z on 10/24/19.
//  Copyright © 2019 Boise State. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    var imagePickerController:UIImagePickerController? = nil
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePickerController = UIImagePickerController()
        
//        imagePickerController?.sourceType = .photoLibrary
        imagePickerController?.delegate = self
        imagePickerController?.allowsEditing = true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePickerController?.dismiss(animated: true, completion: nil)
        
        imageView.image = info[.editedImage] as? UIImage
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        imagePickerController?.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func addPhotoTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Choose Photo Source", message: "Choose a photo for your profile.", preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (alertAction) in
            self.imagePickerController?.sourceType = .photoLibrary
            self.present(self.imagePickerController!, animated: true, completion: nil)
        }))
        
        
        alertController.addAction(UIAlertAction(title: "Camera Library", style: .default, handler: { (alertAction) in
            
            if( UIImagePickerController.isSourceTypeAvailable(.camera) ){
                self.imagePickerController?.sourceType = .camera
            }
            else{
                self.imagePickerController?.sourceType = .savedPhotosAlbum
            }
            
            self.present(self.imagePickerController!, animated: true, completion: nil)
        }))
        
        alertController.addAction(UIAlertAction(title: "Destroy all data!!", style: .destructive, handler: nil))
        
        
        present(alertController, animated: true, completion: nil)
    }
    
}

