//
//  RequestDependentViewController.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 20/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

class RequestDependentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dependent: Dependente?
    
    var mainTabVarView: MainTabBarViewContract?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Theme.backgroundColor
        addCustomCell()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.navigationItem.title = dependent?.getNome()
        
        mainTabVarView?.configureHeaderOn(self)
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

extension RequestDependentViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "registerCell") as! registerCell
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        
        if indexPath.row == 0 {
            cell.titleLabel.text  = "Nome"
            cell.resultLabel.text = dependent?.getNome()
        }
        
        if indexPath.row == 1 {
            cell.titleLabel.text  = "CPF"
            cell.resultLabel.text = dependent?.getCpf()
        }
        
        if indexPath.row == 2 {
            cell.titleLabel.text  = "Rg"
            cell.resultLabel.text = dependent?.getRg()
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let requestDependent: RequestDependentViewController = loadNibNamed("RequestDependentViewController", owner: self)!
//        //        attachmentModelViewController.delegate = self
//        self.navigationController?.pushViewController(requestDependent, animated: true)
//        //        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
