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

    var mainTabVarView: MainTabBarViewContract?

     lazy var registerTabItemPresenter: RegisterTabItemPresenterContract = {
        let apiDataSource: FichaFuncionalApiDataSource = FichaFuncionalApiDataSourceImpl.getInstance()
        let sessionLocalDataSource = SessionLocalDataSource.getInstance(defaultsDao: UserDefaults.standard)

        return RegisterTabItemPresenter(view: self, apiDataSource: apiDataSource, sessionLocalDataSource: sessionLocalDataSource)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Asap-Medium", size: 10)!], for: .normal)
        
        addCustomCell()

        registerTabItemPresenter.getDadadosCadastrais()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mainTabVarView?.configureHeaderOn(self)
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
        
        cell.resultLabel?.text = dadoDto.descricao
        
        if dadoDto.requested {
            cell.cellBackground.backgroundColor = UIColor.clear
            cell.titleLabel?.text = "\(dadoDto.nomeTipo!) Solicitado"
            cell.titleLabel?.textColor = UIColor(red:0.29, green:0.73, blue:1.00, alpha:1.0)
            cell.selectionStyle = UITableViewCellSelectionStyle.none
        } else {
            cell.titleLabel?.text = "\(dadoDto.nomeTipo!)"
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dado = dadosFichaDto[indexPath.row]
        
        if dado.requested {
            return
        }
        
        let attachmentModelViewController: AttachmentModalViewController = loadNibNamed("AttachmentModalViewController", owner: self)!
        attachmentModelViewController.dadoFichaDto = dado
        
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
    func attached(requestDto: RequestDto) {
        registerTabItemPresenter.saveSolicitacao(requestDto.tipoDadoFichaFuncional)
    }
}

extension RegisterTabItemViewController: RegisterTabItemViewContract {

    func loadDadosCadastrais(list: [DadoFichaDto]) {
        dadosFichaDto = list
        self.tableView.reloadData()
    }
}
