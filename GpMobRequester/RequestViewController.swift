//
//  RequestViewController.swift
//  GpMobRequester
//
//  Created by Rodrigo Ribeiro on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

struct registers {
    var title  : String
    var result : String
}

class RequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var arrayFront = [registers]()
    var sections   = ["1", "2", "3", "4"]
    
    var mainTabVarView: MainTabBarViewContract?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createData()
        customNavBar()
        customTheme()
        
        addCustomCell()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainTabVarView?.configureHeaderOn(self)
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

    func customNavBar() {
    }
    
    func customTheme() {
        self.view.backgroundColor = Theme.backgroundColor
    
    }
    
    func addCustomCell() {
        tableView.backgroundColor = UIColor.clear
        tableView.dataSource      = self
        tableView.delegate        = self
        let nib                   = UINib(nibName: "RequestCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "RequestCell")
        self.view.addSubview(tableView)
    }

}

extension RequestViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else if section == 1 {
            return 3
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor    = Theme.backgroundColor
        headerView.layer.cornerRadius = 6
        
        let headerLabel = UILabel(frame: CGRect(x: 5, y: 5, width:
            tableView.bounds.size.width, height: tableView.bounds.size.height))
        headerLabel.font = UIFont(name: "Asap-Medium", size: 15)
        headerLabel.textColor = UIColor.black
        headerLabel.text = self.tableView(self.tableView, titleForHeaderInSection: section)
//        headerLabel.backgroundColor = UIColor(red:0.47, green:0.80, blue:1.00, alpha:1.0)
        headerLabel.sizeToFit()
        headerView.addSubview(headerLabel)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "19/05/2017"
        } else if section == 1 {
            return "21/03/2017"
        }
        return "05/01/2017"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RequestCell") as! RequestCell
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.titleLabel?.text            = arrayFront[indexPath.row].title
        cell.resultLabel?.text           = arrayFront[indexPath.row].result
        
        return cell
    }


}
