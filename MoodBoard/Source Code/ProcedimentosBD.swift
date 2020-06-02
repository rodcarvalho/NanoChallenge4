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
