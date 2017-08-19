//
//  AttachmentModalViewController.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit
import ImagePicker

protocol AttachmentModalViewDelegate {
    func attached(attach: UIImage)
}

class AttachmentModalViewController: UIViewController {
    
    var delegate: AttachmentModalViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modalPresentationStyle = .custom
    }
    
    func showAttachView() {
        let imagePickerController = ImagePickerController()
        imagePickerController.imageLimit = 1
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func attach(_ sender: Any) {
        showAttachView()
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true)
    }
}


extension AttachmentModalViewController: ImagePickerDelegate {
    func cancelButtonDidPress(_ imagePicker: ImagePickerController) {
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func wrapperDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        guard images.count > 0 else { return }
        
    }
    
    func doneButtonDidPress(_ imagePicker: ImagePickerController, images: [UIImage]) {
        
        delegate?.attached(attach: images[0])
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        self.dismiss(animated: true)
        
    }
}
