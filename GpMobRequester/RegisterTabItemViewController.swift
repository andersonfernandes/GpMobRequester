//
//  RegisterTabItemViewController.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation
import UIKit

class RegisterTabItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dadosFichaDto = [DadoFichaDto]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var helloLabel: UILabel!
    
    
    lazy var mainTabBarPresenter: MainTabBarPresenterContract = {
        let sessionLocalDataSource = SessionLocalDataSource.getInstance(defaultsDao: UserDefaults.standard)
        return MainTabPresenter(view: self, sessionLocalDataSource: sessionLocalDataSource)
    }()
    
    lazy var registerTabItemPresenter: RegisterTabItemPresenterContract = {
        let apiDataSource: FichaFuncionalApiDataSource = FichaFuncionalApiDataSourceImpl.getInstance()
        let sessionLocalDataSource = SessionLocalDataSource.getInstance(defaultsDao: UserDefaults.standard)
        
        return RegisterTabItemPresenter(view: self, apiDataSource: apiDataSource, sessionLocalDataSource: sessionLocalDataSource)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Asap-Medium", size: 10)!], for: .normal)
        
        addLogout()
        addChat()

        addCustomCell()
        
        registerTabItemPresenter.getDadadosCadastrais()
    }
    
    func addLogout() {
        let logout = UIBarButtonItem(title: "Play", style: .plain, target: self, action: #selector(logoutTapped))
        logout.image = UIImage(named: "logout")
        logout.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        navigationItem.leftBarButtonItems = [logout]
    }
    
    func logoutTapped(){
        mainTabBarPresenter.logout()
    }

    func addChat() {
        let chatBell = UIBarButtonItem(title: "Chat", style: .plain, target: self, action: #selector(chatTapped))
        chatBell.image = UIImage(named: "bell")
        chatBell.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        navigationItem.rightBarButtonItems = [chatBell]
    }

    func chatTapped() {
    }

    func customNavBar() {
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dadosFichaDto.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "registerCell") as! registerCell
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        
        let dadoDto = dadosFichaDto[indexPath.row]
        
        if dadoDto.nomeTipo == DataTypes.NOME.rawValue {
            helloLabel.text = "Olá, \(dadoDto.descricao!)"
        }
        
        cell.titleLabel?.text  = dadoDto.nomeTipo
        cell.resultLabel?.text = dadoDto.descricao
        
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
    }
}

extension RegisterTabItemViewController: MainTabBarViewContract {

    func goToLogin() {
       self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
}

extension RegisterTabItemViewController: RegisterTabItemViewContract {
    
    func loadDadosCadastrais(list: [DadoFichaDto]) {
        dadosFichaDto = list
        self.tableView.reloadData()
    }
}
