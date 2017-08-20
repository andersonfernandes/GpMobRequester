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

struct RequestDto {
    let descricao: String?
    let tipoDadoFichaFuncional: Int?
    let nomeTipo: String?
    let attach: UIImage?
}

protocol AttachmentModalViewDelegate {
    func attached(requestDto: RequestDto)
}

class AttachmentModalViewController: UIViewController {
    
    @IBOutlet weak var inputToFocus: UITextField!
    @IBOutlet weak var blackBackground: UIView!
    @IBOutlet weak var cameraIconContainer: UIView!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var resultPhotoTaken: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var modalViewShadow: UIView!
    @IBOutlet weak var modalView: UIView!
    
    @IBOutlet weak var headerLb: UILabel!
    
    var delegate: AttachmentModalViewDelegate?
    
    var dadoFichaDto: DadoFichaDto?
    
    var attach: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputToFocus.becomeFirstResponder()
        
        modalViewRadius()
        modalViewSetShadow()
        
        self.view.frame             =  CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.modalPresentationStyle = .overFullScreen
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.headerLb.text = "Alteração \(dadoFichaDto!.nomeTipo!)"
        self.inputToFocus.text = dadoFichaDto!.descricao
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.4, delay: 0.8, options: [], animations: {
                        self.blackBackground.alpha = 0.9
        }, completion: { (finished: Bool) in
            print("bg is on")
        })
    }
    
    func modalViewSetShadow() {
        modalViewShadow.layer.masksToBounds = false
        modalViewShadow.layer.borderWidth   = 0
        modalViewShadow.layer.shadowColor = UIColor.lightGray.cgColor
        modalViewShadow.layer.shadowOpacity = 1.0
        modalViewShadow.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
        modalViewShadow.layer.shadowRadius = 14
    
    }
    
    func modalViewRadius() {
        modalView.layer.cornerRadius           = 8
        cameraIconContainer.layer.cornerRadius = cameraIconContainer.frame.height / 2
        modalView.clipsToBounds                = true
    }
    
    func showAttachView() {
        let imagePickerController = ImagePickerController()
        imagePickerController.imageLimit = 1
        imagePickerController.delegate = self
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func attach(_ sender: Any) {
//        sendRequest here
    }
    
    @IBAction func close(_ sender: Any) {
        UIView.animate(withDuration: 0.2, delay: 0.0, options: [], animations: {
            self.blackBackground.alpha = 0.0
        }, completion: { (finished: Bool) in
            self.dismiss(animated: true)
        })
        
    }
    @IBAction func attachTapped(_ sender: Any) {
        showAttachView()
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
        attach = images[0]
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        sucesseAttachMessage()
        resultPhotoTaken.clipsToBounds = true
        resultPhotoTaken.layer.cornerRadius = resultPhotoTaken.frame.height / 2
        resultPhotoTaken.image              = images[0]
        
        requestButton.alpha = 1
    }
    
    func requestTutorial() {
        weak var pvc = self.presentingViewController
        
        self.dismiss(animated: true, completion: {
            let vc : NotificationReminderView = loadNibNamed("NotificationReminderView", owner: NotificationReminderView.self)!
            pvc?.present(vc, animated: true, completion: {
               
            
                let requestDto = RequestDto(descricao: self.dadoFichaDto?.descricao, tipoDadoFichaFuncional: self.dadoFichaDto?.tipoDadoFichaFuncional, nomeTipo: self.dadoFichaDto?.nomeTipo, attach: self.attach)
                self.delegate?.attached(requestDto: requestDto)
            })
            
           
        })
    
    }
    
    func sucesseAttachMessage() {
        mainLabel.text      = "Documento anexado com sucesso"
        mainLabel.textColor = UIColor.black
        mainLabel.alpha     = 1.0
        
        requestButton.removeTarget(nil, action: nil, for: .allEvents)
//        requestButton.setTitle("Solicitar", for: .normal)
        requestButton.addTarget(self, action: #selector(AttachmentModalViewController.requestTutorial), for: .touchUpInside)
        
          self.dadoFichaDto = DadoFichaDto(descricao: self.inputToFocus.text, tipoDadoFichaFuncional: self.dadoFichaDto?.tipoDadoFichaFuncional, nomeTipo: self.dadoFichaDto?.nomeTipo, requested: true)
    
    }
}
