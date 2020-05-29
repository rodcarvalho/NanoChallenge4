//
//  GuardaRoupa.swift
//  MoodBoard
//
//  Created by Jader Gedeon on 28/05/20.
//  Copyright © 2020 Jader e Rodrigo. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class GuardaRoupaAddViewController: UIViewController {
  
  // Variáveis de objetos

  @IBOutlet weak var txtNomeRoupa: UITextField!
  @IBOutlet weak var txtTipoRoupa: UITextField!
  
  // Variáveis lógicas
  
  // Instanciando banco
  var procBD = ProcedimentosBD()
  
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func SalvarDados(_ sender: Any) {
    
        procBD.SalvarRoupa(nomeRoupa: txtNomeRoupa.text ?? "NULL", tipoRoupa: txtTipoRoupa.text ?? "NULL")
        procBD.CarregarRoupas()
    
  }
}
