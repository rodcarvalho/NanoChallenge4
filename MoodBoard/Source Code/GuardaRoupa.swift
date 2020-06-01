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



class GuardaRoupaAddViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
  
  // Variáveis de objetos
  
  @IBOutlet weak var txtNomeRoupa: UITextField!
  @IBOutlet weak var txtTipoRoupa: UITextField!
  @IBOutlet weak var imagemRoupa: UIImageView!
  @IBOutlet weak var imagemTeste: UIImageView!
  
  
  // Variáveis lógicas
  
  // Instanciando banco
  var procBD = ProcedimentosBD()
  
  
  
  
  
  override func viewDidLoad() {
    
    //PARTE COPIADA
    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(cameraButtonPressed))
    //FIM PARTE COPIADA
    
    super.viewDidLoad()
  }
  
  //PARTE COPIADA
  @objc func cameraButtonPressed() {
    let picker = UIImagePickerController()
    picker.delegate = self
    picker.allowsEditing = true
    picker.sourceType = .photoLibrary
    present(picker, animated: true)
  }
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let userPickedImage = info[.editedImage] as? UIImage else { return }
    imagemRoupa.image = userPickedImage
    picker.dismiss(animated: true)
  }
  //FIM PARTE COPIADA
  
  @IBAction func SalvarDados(_ sender: Any) {
    
    procBD.apagarTodosRegistros()
    procBD.apagarApenasUmRegistro()
    procBD.SalvarRoupa(nomeRoupa: txtNomeRoupa.text ?? "NULL", tipoRoupa: txtTipoRoupa.text ?? "NULL",imagemRoupa: (imagemRoupa.image?.pngData())!)
    //imagemTeste.image = UIImage(data: procBD.CarregarRoupas())
    
    
    
  }
}
