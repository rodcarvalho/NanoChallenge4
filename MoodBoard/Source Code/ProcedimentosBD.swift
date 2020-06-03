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
    
    func CarregarRoupas(input: String) -> [Roupa]{
        
        var matrizRoupas = [Roupa]()
        
        let requisição = NSFetchRequest<NSFetchRequestResult>(entityName: "Roupas")
        
        if input != "" {
            requisição.predicate = NSPredicate(format: "tipo CONTAINS[c] %@", input)
        }
        
        do{
            let consulta = try banco.fetch(requisição)
            
            for dados in consulta as! [NSManagedObject]{
                
                let idRoupa = dados.value(forKey: "id") as! Int
                let nomeRoupa = dados.value(forKey: "nome") as! String
                let tipoRoupa = dados.value(forKey: "tipo") as! String
                let imagemRoupa = dados.value(forKey: "imagem") as! Data
                
                print(nomeRoupa)
                matrizRoupas.append(Roupa(idRoupa: idRoupa,
                                          nomeRoupa: nomeRoupa,
                                          tipoRoupa: tipoRoupa,
                                          imagemRoupa: UIImage(data: imagemRoupa)!))
                
            }
            
        } catch {
            print("Erro ao carregar")
        }
        print("Chamou tudo")
        return matrizRoupas
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
    
    func CarregarTodasRoupas() -> [Roupa]{
        
        var matrizRoupas = [Roupa]()
        
        let requisição = NSFetchRequest<NSFetchRequestResult>(entityName: "Roupas")
        
        do{
            let consulta = try banco.fetch(requisição)
            
            for dados in consulta as! [NSManagedObject]{
                
                let idRoupa = dados.value(forKey: "id") as! Int
                let nomeRoupa = dados.value(forKey: "nome") as! String
                let tipoRoupa = dados.value(forKey: "tipo") as! String
                let imagemRoupa = dados.value(forKey: "imagem") as! Data
                
                print(nomeRoupa)
                matrizRoupas.append(Roupa(idRoupa: idRoupa,
                                          nomeRoupa: nomeRoupa,
                                          tipoRoupa: tipoRoupa,
                                          imagemRoupa: UIImage(data: imagemRoupa)!))
                
            }
            
        } catch {
            print("Erro ao carregar")
        }
        print("Chamou tudo")
        return matrizRoupas
    }
}
