//
//  DependentsTabItemViewController.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

class DependentsTabItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dependents = [Dependente]()
    
    var mainTabVarView: MainTabBarViewContract?
    
    
    lazy var dependentsTabItemPresenter: DependentsTabItemPresenterContract = {
        let apiDataSource: FichaFuncionalApiDataSource = FichaFuncionalApiDataSourceImpl.getInstance()
        let sessionLocalDataSource = SessionLocalDataSource.getInstance(defaultsDao: UserDefaults.standard)
        
        return DependentsTabItemPresenter(view: self, apiDataSource: apiDataSource, sessionLocalDataSource: sessionLocalDataSource)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Theme.backgroundColor
        addCustomCell()
        
        dependentsTabItemPresenter.getDependents()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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

extension DependentsTabItemViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dependents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "registerCell") as! registerCell
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        
        let dependent = dependents[indexPath.row]
        cell.titleLabel.text  = dependent.getNome()
        cell.resultLabel.text = dependent.getParentesco()
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let requestDependent: RequestDependentViewController = loadNibNamed("RequestDependentViewController", owner: self)!
        requestDependent.dependent = self.dependents[indexPath.row]
//        attachmentModelViewController.delegate = self
        self.navigationController?.pushViewController(requestDependent, animated: true)
//        tableView.deselectRow(at: indexPath, animated: true)
    }

}


extension DependentsTabItemViewController: DependentsTabItemViewContract {
    
    func loadDependentes(list: [Dependente]) {
        dependents = list
        self.tableView.reloadData()
    }
}
