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
    
    let sessionLocalDataSource: SessionLocalDataSource = SessionLocalDataSource.getInstance(defaultsDao: UserDefaults.standard)
    
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
        
        var tipoDadoFichaFuncional: Int?
        var nomeTipo: String?
        
        if indexPath.row == 0 {
            nomeTipo  = "Nome"
            cell.resultLabel.text = dependent?.getNome()
            tipoDadoFichaFuncional = 111111
        }
        
        if indexPath.row == 1 {
            nomeTipo  = "CPF"
            cell.resultLabel.text = dependent?.getCpf()
            tipoDadoFichaFuncional = 222222
        }
        
        if indexPath.row == 2 {
            nomeTipo  = "Rg"
            cell.resultLabel.text = dependent?.getRg()
            tipoDadoFichaFuncional = 333333
        }
        
        if hasSolicitacao(tipoDadoFichaFuncional) {
            cell.cellBackground.backgroundColor = UIColor.clear
            cell.titleLabel?.text = "\(nomeTipo!) Solicitado"
            cell.titleLabel?.textColor = UIColor(red:0.29, green:0.73, blue:1.00, alpha:1.0)
            cell.selectionStyle = UITableViewCellSelectionStyle.none
        } else {
            cell.titleLabel.text  = nomeTipo
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let attachmentModelViewController: AttachmentModalViewController = loadNibNamed("AttachmentModalViewController", owner: self)!
        
        var descricao: String?
        var nomeTipo: String?
        var tipoDadoFichaFuncional: Int?
        
        if indexPath.row == 0 {
            descricao = dependent?.getNome()
            nomeTipo  = "Nome"
            tipoDadoFichaFuncional = 111111
        }
        
        if indexPath.row == 1 {
            descricao = dependent?.getCpf()
            nomeTipo  = "CPF"
            tipoDadoFichaFuncional = 222222
        }
        
        if indexPath.row == 2 {
            descricao = dependent?.getRg()
            nomeTipo  = "Rg"
            tipoDadoFichaFuncional = 333333
        }
        
        attachmentModelViewController.dadoFichaDto = DadoFichaDto(descricao: descricao, tipoDadoFichaFuncional: tipoDadoFichaFuncional, nomeTipo: nomeTipo, requested: false)
        
        attachmentModelViewController.delegate = self
        
        self.present(attachmentModelViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func hasSolicitacao(_ tipoDadoFuncional: Int?) -> Bool {
        let tipo = sessionLocalDataSource.getSolicitacao(tipoDadoFuncional)
        return tipo != nil && tipo != 0
    }
    
}


extension RequestDependentViewController: AttachmentModalViewDelegate {
    func attached(requestDto: RequestDto) {
        sessionLocalDataSource.saveSolicitacao(requestDto.tipoDadoFichaFuncional)
    }
}
