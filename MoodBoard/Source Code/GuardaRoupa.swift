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


class GuardaRoupaAddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    // Variáveis de objetos
    @IBOutlet weak var txtNomeRoupa: UITextField!
    
    @IBOutlet weak var pickerTipoRoupa: UIPickerView!
    
    @IBOutlet weak var imagemRoupa: UIImageView!
    
    
    // Variáveis lógicas
    var novaImagem = false
    
    let tiposDeRoupa = ["Chapéu","Acessório","Torso","Calçado","Calça"]
    
    // Instanciando banco
    var procBD = ProcedimentosBD()
    
    
    override func viewDidLoad() {
        
        // Adicionando função à imagem
        let apertarImagem = UITapGestureRecognizer(target: self, action: #selector(selecionarImagem))
        imagemRoupa.addGestureRecognizer(apertarImagem)
        
        // Adicionando picker
        pickerTipoRoupa.delegate = self
        pickerTipoRoupa.dataSource = self
        pickerTipoRoupa.selectRow(tiposDeRoupa.count/2, inComponent: 0, animated: true)
        
        super.viewDidLoad()
    }
    
    // Selecionar imagem da galeria e importa-la para o app
    @objc func selecionarImagem() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = .photoLibrary
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let imagemSelecionada = info[.editedImage] as? UIImage else { return }
        imagemRoupa.image = imagemSelecionada
        picker.dismiss(animated: true)
        novaImagem = true
    }
    
    // Configuração do PickerView dos tipos de roupas
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tiposDeRoupa.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tiposDeRoupa[row]
    }
    
    // Função que salva os dados da roupa no BD
    @IBAction func SalvarDados(_ sender: Any) {
        
        if txtNomeRoupa.text != "" && novaImagem == true {
            procBD.SalvarRoupa(
                nomeRoupa: txtNomeRoupa.text ?? "NULL",
                tipoRoupa: tiposDeRoupa[pickerTipoRoupa.selectedRow(inComponent: 0)],
                imagemRoupa: (imagemRoupa.image?.pngData())!
            )
            
            //Lembrar de adicionar uma notificação pra mostrar que foi salvo com sucesso
            
            //Reinicia valores da tela
            txtNomeRoupa.text = ""
            pickerTipoRoupa.selectRow(tiposDeRoupa.count/2, inComponent: 0, animated: true)
            imagemRoupa.image = UIImage.init(systemName: "square.and.arrow.up")
            novaImagem = false
            
        }
    }
}
