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
    
    
    
    func SalvarRoupa(nomeRoupa : String, tipoRoupa : String){
        
        // Definindo novo objeto a ser inserido
        
        let novaRoupa = NSManagedObject(entity: tabelaRoupas!, insertInto: banco)
        
        // Atribuindo seus valores
        
        novaRoupa.setValue(nomeRoupa, forKey: "nome")
        novaRoupa.setValue(tipoRoupa, forKey: "tipo")
        
        // Tenta realizar a conexão e salvamento no banco
        
        do{
            try banco.save()
            print("Salvo")
        } catch {
            print("Errou")
        }
    }
    
    func CarregarRoupas(){
        
        var matrizRoupas = [[String]]()
        
        // Faz uma requisição na tabela Roupas
        let requisição = NSFetchRequest<NSFetchRequestResult>(entityName: "Roupas")
        
        requisição.returnsObjectsAsFaults = false
        
        
        do{
            // Faz uma consulta no banco de dados selecionando todos os dados que tiverem sido requisitados
            let consulta = try banco.fetch(requisição)
            
            // Para cada objeto na consulta
            for dados in consulta as! [NSManagedObject]{
                
                //matrizRoupas[index][1] = dados.value(forKey: "id") as! String
                let nomeRoupa = dados.value(forKey: "nome") as! String
                let tipoRoupa = dados.value(forKey: "tipo") as! String
                //matrizRoupas[index][4] = dados.value(forKey: "imagem") as! String
                
                matrizRoupas.append([nomeRoupa,tipoRoupa])
                
                
            }
        } catch {
            print("Erro ao carregar")
        }
        for valores in matrizRoupas{
            print(valores)
        }
        
    }
    
    func CarregarTodasRoupas() -> [[Roupa]]{
        
        var matrizRoupas = [[Roupa]]()
        
        let requisição = NSFetchRequest<NSFetchRequestResult>(entityName: "Roupas")
        
        do{
            let consulta = try banco.fetch(requisição)
            
            var index = 0

            for dados in consulta as! [NSManagedObject]{

              let idRoupa = dados.value(forKey: "id") as! Int
              let nomeRoupa = dados.value(forKey: "nome") as! String
              let tipoRoupa = dados.value(forKey: "tipo") as! String
              let imagemRoupa = dados.value(forKey: "imagem") as! Data

                matrizRoupas[index].append(Roupa(idRoupa: idRoupa,
                                                 nomeRoupa: nomeRoupa,
                                                 tipoRoupa: tipoRoupa,
                                                 imagemRoupa: UIImage(data: imagemRoupa)!))

              index+=1
                
            }
            
        } catch {
            print("Erro ao carregar")
        }
        print("Chamou tudo")
        return matrizRoupas
    }
}
