//
//  RegisterTabItemViewController.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

struct registers {
    var title  : String
    var result : String
}

class RegisterTabItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrayFront = [registers]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Asap-Medium", size: 10)!], for: .normal)
        
        addLogout()
        addChat()
        
        addCustomCell()
        createData()
    }
    
    func addLogout() {
        let logout = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(logoutTapped))
        logout.image = UIImage(named: "logout")
        logout.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        navigationItem.leftBarButtonItems = [logout]
    }
    
    func addChat() {
        let chatBell = UIBarButtonItem(title: "Chat", style: .plain, target: self, action: #selector(chatTapped))
        chatBell.image = UIImage(named: "bell")
        chatBell.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        navigationItem.rightBarButtonItems = [chatBell]
    }
    
    func logoutTapped() {
    }
    
    func chatTapped() {
    }
    
    func customNavBar() {
    }
    
    func createData() {
        
        let name        = registers(title: "Nome", result: "Rodrigo Ribeiro")
        let civilState  = registers(title: "Estado Civil", result: "Solteiro")
        let telephone   = registers(title: "Telephone", result: "55 (82) 99812.4444")
        let adress      = registers(title: "Endereço", result: "Av.Júlio Marques Luz")
        let instruction = registers(title: "Grau de Instrução", result: "Ensino Médio Completo")
        
        arrayFront.append(name)
        arrayFront.append(civilState)
        arrayFront.append(telephone)
        arrayFront.append(adress)
        arrayFront.append(instruction)
    
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFront.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "registerCell") as! registerCell
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.titleLabel?.text            = arrayFront[indexPath.row].title
        cell.resultLabel?.text           = arrayFront[indexPath.row].result
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let attachmentModelViewController: AttachmentModalViewController = loadNibNamed("AttachmentModalViewController", owner: self)!
        attachmentModelViewController.delegate = self
        self.present(attachmentModelViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func addCustomCell() {
        tableView.backgroundColor = UIColor.clear
        tableView.dataSource      = self
        tableView.delegate        = self
        let nib                   = UINib(nibName: "registerCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "registerCell")
        self.view.addSubview(tableView)
    }
    
}

extension RegisterTabItemViewController: AttachmentModalViewDelegate {
    func attached(attach: UIImage) {
        let a  = true
    }
}

