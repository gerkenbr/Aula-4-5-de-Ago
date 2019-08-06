//
//  main.swift
//  Aula 4 5 de Ago
//
//  Created by Digital House on 05/08/19.
//  Copyright © 2019 Alexandre Gerken Brasil. All rights reserved.
//

import Foundation

// TEMA DA AULA - OPTIONAL

var nome: String? // ? denota optional
print(nome) // resulta nil
//print(nome!) resulta crash, tentou forçar unwrap(!) o optional com "nil"
print(nome ?? "não tem valor") // usar o if ternario para evitar o nil caso o optional esteja vazio(nil)

nome = "Alexandre"              // assignando um valor, o if ternario vai resultar no valor, nao usando o "default"
print(nome ?? "não tem valor")

var idade: Int?
if let age = idade {            // if let x = optional para tratar o optional = nil
    print(age)                  // variavel "age"disponivel apenas entro do IF
} else {
    print ("age sem valor")     // neste caso, resultara o ELSE, pq idade = nil
}
idade = 45
if let age = idade {
    print(age)
} else {
    print("nao tem valor")      // aqui resultara 45, pq idade = 45
}

func imprimirEndereco() {
    var endereco: String?
    guard let address = endereco else {return}  // outra maneira de tratar o OPTIONAL nil, valido apenas dentro de func
    print("passei por aqui")
    print(address)                              // variavel criada dentro do guard disponivel no metodo
}
imprimirEndereco()  // funcao nao resulta nada pq o OPTIONAL = nil

func registerUser(nome name: String, endereço address: String? = "Avenida Paulista", age: Int?) {
                                                    // o valor declarado na assinatura é o valor padrao para o Parametro
    var fullUser: String?
    fullUser = ""
    fullUser?.append("Meu nome e': \(name), ")  // usar o ? pq fullUser 'e Optional
    
    let myAddress = address ?? ""
    fullUser?.append("Meu endereco e' \(myAddress), ")
    
    if let myAge = age {
        fullUser?.append("Minha idade e' \(myAge)")
    }
    print(fullUser ?? "")
}
registerUser(nome: "Alexandre", endereço: "Rua São Carlos do Pinhal", age: 45)
// na funcao regsiterUser, endereco e age podem ser nil, pois foram declarados OPTIONAL na assinatura
registerUser(nome: "Alexandre", age: nil)

// CASTING - Converter entre types de dados

let numero1: Int = 10
let numero2: Float = 20.5
let resultado = Float(numero1) + numero2
// let resultado2 = numero1 as? Float ?? 0 + numero2
print(resultado)

let numeroString = "2"
let numeroConvertido = Int(numeroString) ?? 0 // tratar como optional pq o string pode nao ser numero
let somaDoNumeroConvertido = numeroConvertido + 2
print(somaDoNumeroConvertido)

// DESAFIO
// CRIAR UM MÉTODO QUE ACEITA 4 PARAMETROS String , SENDO 1 Obrigatório, e 3 Opcionais (nome, idade, endereco e CEP), checar os 3 parametros e no final imprimir todos os parametros juntos

func junta4String(nome novoNome: String, idade novoIdade: String? = "", endereco novoEndereco: String? = "", CEP novoCEP: String? = "") {
var novoCompleto: String = ""
novoCompleto += novoNome + ", "
novoCompleto += novoIdade ?? ""
novoCompleto += ", " + (novoEndereco ?? "")
novoCompleto += ", " + (novoCEP ?? "")
print(novoCompleto)
}

junta4String(nome: "Alexandre", idade: "45", endereco: "Av. Paulista", CEP: "01333-904")
