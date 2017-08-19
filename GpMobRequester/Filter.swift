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
}

func groupByOnCadastro(fichaFuncional: FichaFuncional, list: [String]) -> [DadoFichaDto] {
    
    var result = [DadoFichaDto]()
    let groups =  fichaFuncional.getGrupos()?.filter { $0.getDescricao() == "" }
    
    groups?.forEach { g in
        let dataList = g.getDados()?.filter { list.contains($0.getTipoDadoFichaFuncional()?.getNome() ?? "") }
        let data = dataList?.first
        
        
        if data != nil {
            result.append(DadoFichaDto(descricao: data?.getDescricao(), tipoDadoFichaFuncional: data?.getTipoDadoFichaFuncional()?.getId()))
        }
    }
    
    return result
}
