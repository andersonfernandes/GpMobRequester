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
    
    var mainTabVarView: MainTabBarViewContract?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Theme.backgroundColor
        addCustomCell()
        createData()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mainTabVarView?.configureHeaderOn(self)
    }
    
    func createData() {
        
        let name        = pendency(title: "Filho", result: "Jose Vieira Filho")
       
        arrayFront.append(name)
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
