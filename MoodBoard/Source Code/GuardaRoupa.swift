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
  
  
  // Variáveis lógicas
  
  var novaImagem = false
  
  // Instanciando banco
  var procBD = ProcedimentosBD()
  
  
  override func viewDidLoad() {
    
    //PARTE COPIADA
    
    
    //FIM PARTE COPIADA
    
    let apertarImagem = UITapGestureRecognizer(target: self, action: #selector(cameraButtonPressed))
    
    imagemRoupa.addGestureRecognizer(apertarImagem)
    
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
    novaImagem = true
  }
  //FIM PARTE COPIADA
  
  @IBAction func SalvarDados(_ sender: Any) {
    
    
    if txtNomeRoupa.text != "" && novaImagem == true{
      //procBD.apagarTodosRegistros()
      //procBD.apagarApenasUmRegistro()
      procBD.SalvarRoupa(
        nomeRoupa: txtNomeRoupa.text ?? "NULL",
        tipoRoupa: txtTipoRoupa.text ?? "NULL",
        imagemRoupa: (imagemRoupa.image?.pngData())!
      )
      //imagemTeste.image = UIImage(data: procBD.CarregarRoupas())
      
      //Lembrar de adicionar uma notificação pra mostrar que foi salvo com sucesso
      
      ///Reinicia valores da tela
      txtNomeRoupa.text = ""
      txtTipoRoupa.text = ""
      imagemRoupa.image = UIImage.init(systemName: "square.and.arrow.up")
      novaImagem = false
    }
  }
}
