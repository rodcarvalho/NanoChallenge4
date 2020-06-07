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
    
    
    func SalvarRoupa(idRoupa: Int,nomeRoupa : String, tipoRoupa : String, imagemRoupa : Data, categoriaRoupa : [String]){
        // Definindo novo objeto a ser inserido
        
        let novaRoupa = NSManagedObject(entity: tabelaRoupas!, insertInto: banco)
        
        // Atribuindo seus valores
        novaRoupa.setValue(idRoupa, forKey: "id")
        novaRoupa.setValue(nomeRoupa, forKey: "nome")
        novaRoupa.setValue(tipoRoupa, forKey: "tipo")
        novaRoupa.setValue(imagemRoupa, forKey: "imagem")
        novaRoupa.setValue(categoriaRoupa, forKey: "categoria")
        
        
        do{
            try banco.save()
        } catch {
            print("Errou")
        }
    }
    
    // Carregar Roupa
    
    func CarregarRoupas(input: String) -> [Roupa]{
        
        var matrizRoupas = [Roupa]()
        
        let requisição = NSFetchRequest<NSFetchRequestResult>(entityName: "Roupas")
        
        if input != "" {
            requisição.predicate = NSPredicate(format: "nome CONTAINS[c] %@", input)
        }
        
        do{
            let consulta = try banco.fetch(requisição)
            
            for dados in consulta as! [NSManagedObject]{
                
                let idRoupa = dados.value(forKey: "id") as! Int
                let nomeRoupa = dados.value(forKey: "nome") as! String
                let tipoRoupa = dados.value(forKey: "tipo") as! String
                let imagemRoupaBD = dados.value(forKey: "imagem") as! Data
                print(dados.value(forKey: "categoria") as? [String] ?? "")
                
                
                matrizRoupas.append(Roupa(idRoupa: idRoupa,
                                          nomeRoupa: nomeRoupa,
                                          tipoRoupa: tipoRoupa,
                                          imagemRoupa: UIImage(data: imagemRoupaBD)!
                                         )
                                    )
                
            }
            
        } catch {
            print("Erro ao carregar")
        }
        print(matrizRoupas)
        return matrizRoupas
    }
    
    // Apaga Todos os registros do BD
    
    func apagarTodosRegistros(){
        
        let requisição = NSFetchRequest<NSFetchRequestResult>(entityName: "Roupas")
        let deletar = NSBatchDeleteRequest(fetchRequest: requisição)
        
        do {
            try banco.execute(deletar)
        } catch {
            print("Erro ao apagar todos os registros")
        }
        
    }
    
    // Apaga um registro pelo seu ID
    
    func apagarApenasUmRegistro(idRoupa: Int){
        
        let requisição = NSFetchRequest<NSFetchRequestResult>(entityName: "Roupas")
        
        requisição.predicate = NSPredicate(format: "id == \(idRoupa)")
        
        let deletar = NSBatchDeleteRequest(fetchRequest: requisição)
        
        do {
            try banco.execute(deletar)
        } catch {
            print("Erro ao apagar todos os registros")
        }
        
    }
    
    // Pega o último ID do guarda-roupa
    
    func pegarIDRoupa() -> Int {
    
    let requisição = NSFetchRequest<NSFetchRequestResult>(entityName: "Roupas")
        
    var ultimoID = 0

    do{
        let consulta = try banco.fetch(requisição)
        
        for dados in consulta as! [NSManagedObject]{
            
            let idRoupa = dados.value(forKey: "id") as! Int
            ultimoID = idRoupa
        }
        
    } catch {
        print("Erro ao carregar")
    }
    return ultimoID
    }
    
    
    func selecionarLook(categoria: String) -> [item] {
        var vetorLook = [item]()
        
        let requisição = NSFetchRequest<NSFetchRequestResult>(entityName: "Roupas")
        
        requisição.predicate = NSPredicate(format: "tipo CONTAINS[c] %@", categoria)
        
        do{
            let consulta = try banco.fetch(requisição)
            
            for dados in consulta as! [NSManagedObject]{
                
                let imagemRoupaBD = dados.value(forKey: "imagem") as! Data
                
                vetorLook.append(item( imagem: UIImage(data: imagemRoupaBD)!))
            }
            
        } catch {
            print("Erro ao carregar")
        }
        return vetorLook
    }
}
