//
//  Filter.swift
//  GpMobRequester
//
//  Created by Anderson Fernandes on 19/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

enum DataTypes: String {
    case NOME               = "Nome"
    case ESTADO_CIVIL       = "Estado Civil"
    case TELEFONE           = "Telefone"
    case ENDERECO           = "Endereço"
    case GRAU_DE_INSTRUCAO  = "Grau de Instrução"
}

struct DadoFichaDto {
    let descricao: String?
    let tipoDadoFichaFuncional: Int?
    let nomeTipo: String?
}

func groupByOnCadastro(fichaFuncional: FichaFuncional, list: [String]) -> [DadoFichaDto] {
    
    var result = [DadoFichaDto]()
    let groups =  fichaFuncional.getGrupos()?.filter { $0.getDescricao() == "Cadastro" }
    
    let dadosGrupo = groups?.filter { $0.getDescricao() == "Cadastro" }.first?.getDados()
    
    dadosGrupo?.forEach { d in
        if list.contains((d.getTipoDadoFichaFuncional()?.getNomeTipo()!)!) {
            result.append(DadoFichaDto(descricao: d.getDescricao(), tipoDadoFichaFuncional: d.getTipoDadoFichaFuncional()?.getId(), nomeTipo: d.getTipoDadoFichaFuncional()?.getNomeTipo()))
        }
    }
    
    return result
}