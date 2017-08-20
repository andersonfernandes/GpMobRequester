//
//  DependentsTabItemViewController.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

struct pendency {
    var title  : String
    var result : String
}

class DependentsTabItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var arrayFront = [pendency]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Theme.backgroundColor
        addLogout()
        addChat()
        addCustomCell()
        createData()
        
    }
    
    func createData() {
        
        let name        = pendency(title: "Filho", result: "Rodrigo Ribeiro")
        let civilState  = pendency(title: "Filho", result: "Rodrigo Ribeiro")
        let telephone   = pendency(title: "Filho", result: "Rodrigo Ribeiro")
        let adress      = pendency(title: "Filho", result: "Rodrigo Ribeiro")
        let instruction = pendency(title: "Filho", result: "Rodrigo Ribeiro")
        
        arrayFront.append(name)
        arrayFront.append(civilState)
        arrayFront.append(telephone)
        arrayFront.append(adress)
        arrayFront.append(instruction)
        
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
    
    func addCustomCell() {
        tableView.backgroundColor = UIColor.clear
        tableView.dataSource      = self
        tableView.delegate        = self
        let nib                   = UINib(nibName: "registerCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "registerCell")
        self.view.addSubview(tableView)
    }
    
}

extension DependentsTabItemViewController {
    
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
        cell.resultLabel.text      = arrayFront[indexPath.row].result
        cell.titleLabel.text       = arrayFront[indexPath.row].title
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let attachmentModelViewController: AttachmentModalViewController = loadNibNamed("AttachmentModalViewController", owner: self)!
//        attachmentModelViewController.delegate = self
//        self.present(attachmentModelViewController, animated: true)
//        tableView.deselectRow(at: indexPath, animated: true)
    }

}
