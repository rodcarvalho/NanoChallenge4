//
//  ProcedimentosBD.swift
//  MoodBoard
//
//  Created by Jader Gedeon on 29/05/20.
//  Copyright © 2020 Jader e Rodrigo. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class ProcedimentosBD{
  
  let banco : NSManagedObjectContext
  let tabelaRoupas : NSEntityDescription?
  
  init(){
    // Definição do banco de dados
    self.banco = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Definição das tabelas [Roupas]
    self.tabelaRoupas = NSEntityDescription.entity(forEntityName: "Roupas", in: banco)
  }
  
  
  
  func SalvarRoupa(nomeRoupa : String, tipoRoupa : String, imagemRoupa : Data){
    // Definindo novo objeto a ser inserido
    
    let novaRoupa = NSManagedObject(entity: tabelaRoupas!, insertInto: banco)
    
    // Atribuindo seus valores
    
    novaRoupa.setValue(nomeRoupa, forKey: "nome")
    novaRoupa.setValue(tipoRoupa, forKey: "tipo")
    novaRoupa.setValue(imagemRoupa, forKey: "imagem")
    
    // Tenta realizar a conexão e salvamento no banco
    
    do{
      try banco.save()
      print("Salvo")
    } catch {
      print("Errou")
    }
  }
  
  func CarregarRoupas() -> Data{
    
    var matrizRoupas = [[String]]()
    
    var RetornarImagem : Data
    RetornarImagem = Data.init()
    
    // Faz uma requisição na tabela Roupas
    let requisição = NSFetchRequest<NSFetchRequestResult>(entityName: "Roupas")
    
    //requisição.returnsObjectsAsFaults = false
    
    //requisição.predicate = NSPredicate(format: "nome == %@", "Oie")
    
    
    do{
      // Faz uma consulta no banco de dados selecionando todos os dados que tiverem sido requisitados
      let consulta = try banco.fetch(requisição)
      
      // Para cada objeto na consulta
      for dados in consulta as! [NSManagedObject]{
        
        //matrizRoupas[index][1] = dados.value(forKey: "id") as! String
        let nomeRoupa = dados.value(forKey: "nome") as! String
        let tipoRoupa = dados.value(forKey: "tipo") as! String
        
        if dados.value(forKey: "imagem") != nil{
          RetornarImagem = dados.value(forKey: "imagem") as! Data
        }
        //matrizRoupas[index][4] = dados.value(forKey: "imagem") as! String
        
        matrizRoupas.append([nomeRoupa,tipoRoupa])
        
        
      }
    } catch {
      print("Erro ao carregar")
    }
    for valores in matrizRoupas{
      print(valores)
      
    }
    return RetornarImagem
  }
  
  func apagarTodosRegistros(){
    
    let requisição = NSFetchRequest<NSFetchRequestResult>(entityName: "Roupas")
    let deletar = NSBatchDeleteRequest(fetchRequest: requisição)
    
    do {
      try banco.execute(deletar)
    } catch {
      print("Erro ao apagar todos os registros")
    }
    
  }
  
  func apagarApenasUmRegistro(){
    
    let requisição = NSFetchRequest<NSFetchRequestResult>(entityName: "Roupas")
    
    requisição.predicate = NSPredicate(format: "tipo == %@", "DDD")
    
    let deletar = NSBatchDeleteRequest(fetchRequest: requisição)
    
    do {
      try banco.execute(deletar)
      print("Apagado")
    } catch {
      print("Erro ao apagar todos os registros")
    }
    
  }
}
