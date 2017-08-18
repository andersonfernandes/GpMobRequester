//
//  Dependente.swift
//  GpMobRequester
//
//  Created by Rachid Calazans on 18/08/17.
//  Copyright © 2017 Stant. All rights reserved.
//

import Foundation

struct Dependente {
    private let id: Int?
    private let idDependenteOrigem: Int? // Doc está como String, mas dev disso q era Int
    private let numeroPessoaFuncionario: Int?
    private let tipoStatus: String?
    private let numeroPessoaInclusao: Int?
    private let numeroPessoaAlteracao: Int?
    private let dataInclusao: Int?
    private let dataAlteracao: Int?
    private let nome: String?
    private let tipoParentesco: TipoParentesco?
}
