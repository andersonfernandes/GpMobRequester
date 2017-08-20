//
//  ChatViewController.swift
//  GpMobRequester
//
//  Created by Rodrigo Ribeiro on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

class ChatViewController: UIViewController {
    
    @IBOutlet weak var bottomBarToInput: UIView!
    @IBOutlet weak var msgTxt: UITextField!
    
    var msgs = [UITextView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hidesBottomBarWhenPushed = true
        
        self.navigationItem.title = "Suporte"
        
        
        bottomBarToInput.layer.borderWidth   = 0
        bottomBarToInput.layer.shadowColor = UIColor.lightGray.cgColor
        bottomBarToInput.layer.shadowOpacity = 0.3
        bottomBarToInput.layer.shadowOffset = CGSize(width: 0, height:0)
        bottomBarToInput.layer.shadowRadius = 6
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        let m = botMsg("Olá! Estou aqui para tirar todas suas dúvidas. \nBasta me informar o que gostaria de saber.")
        
        let f = CGRect(x: 20, y: m.frame.origin.y + m.frame.height + 5, width: 0, height: 0)
        let l = UILabel(frame: f)
        let myDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.string(from:myDate)
        l.text = dateString
        l.font = UIFont(name: "Asap-Medium", size: 10)
        
        l.sizeToFit()
        
        msgs.append(m)
        
        self.view.addSubview(m)
        self.view.addSubview(l)
        
    }

    func botMsg(_ msg: String, frame: CGRect = CGRect(x: 20, y: 80, width: 0, height: 0)) -> UITextView {
        let msgLabel = UITextView(frame: frame)
        msgLabel.layer.cornerRadius = 8
        msgLabel.backgroundColor = UIColor.purple
        msgLabel.text = msg
        msgLabel.font = UIFont(name: "Asap-Medium", size: 14)
        msgLabel.textColor = UIColor.white
        
        
        
        msgLabel.sizeToFit()
        
        return msgLabel
    }
    
    @IBAction func sendMsg(_ sender: Any) {
        sendMsg2(msgTxt.text)
        
    }
    
    func sendBotResponse(_ msg: String) {
        let y = Int(msgs.last!.frame.origin.y + 80.0)
        let frame = CGRect(x: 20, y: y, width: 0, height: 0)
        let m = botMsg(msg, frame: frame)
        
        let f = CGRect(x: 20, y: m.frame.origin.y + m.frame.height + 5, width: 0, height: 0)
        let l = UILabel(frame: f)
        let myDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.string(from:myDate)
        l.text = dateString
        l.font = UIFont(name: "Asap-Medium", size: 10)
        
        
        l.sizeToFit()
        
        msgs.append(m)
        
        self.view.addSubview(m)
        self.view.addSubview(l)
    }
    
    func sendMsg2(_ msg: String?) {
        if !(msg!.isEmpty) {
            var y = 80
            
            if !msgs.isEmpty {
                y = Int(msgs.last!.frame.origin.y + 80.0)
            }
        
            
            
            let frame = CGRect(x: 20, y: y, width: 0, height: 0)
            let m = botMsg(msg!, frame: frame)
            m.backgroundColor = Theme.primaryColor
            let f = CGRect(x: 20, y: m.frame.origin.y + m.frame.height + 5, width: 0, height: 0)
            let l = UILabel(frame: f)
            
            let myDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let dateString = dateFormatter.string(from:myDate)
            
            l.text = dateString
            
            l.font = UIFont(name: "Asap-Medium", size: 10)
            
            let x = self.view.frame.width - m.frame.width - 20
            
            let x2 = self.view.frame.width - l.frame.width - 50
            
            
            self.view.addSubview(m)
            self.view.addSubview(l)
            
            
            UIView.animate(withDuration: 0.2,
                           delay: 0.0,
                           options: UIViewAnimationOptions.curveEaseInOut,
                           animations: { () -> Void in
                            
                            m.frame = CGRect(x: x, y: m.frame.origin.y, width: m.frame.width, height: m.frame.height)
                            l.frame = CGRect(x: x2, y: m.frame.origin.y + m.frame.height + 5, width: 0, height: 0)
                            
            }, completion: { (finished) -> Void in
                // ....
            })
            
            m.textAlignment = .right
            l.textAlignment = .right
            l.sizeToFit()
            
            
            msgs.append(m)
            
//            self.view.addSubview(m)
//            self.view.addSubview(l)
            
            msgTxt.text = ""
            
            if msg == "Documentos para Nome?" {
                let mm = "Você precisará de uma certidão\nde nascimento ou casamento.\n\nPosso ser útil me mais alguma coisa??"
                sendBotResponse(mm)
            }
            
            if msg == "Obrigado" {
                let mm = "Por nada! Qualquer coisa estou por aqui!"
                sendBotResponse(mm)
            }
            
            if msg == "Oi" {
                let mm = "Oi, tudo bem? Como posso ajudar?"
                sendBotResponse(mm)
            }
        }
    }

}
