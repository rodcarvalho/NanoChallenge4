//
//  MoodBoard.swift
//  MoodBoard
//
//  Created by Jader Gedeon on 04/06/20.
//  Copyright © 2020 Jader e Rodrigo. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class MoodBoardViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource/*, UIImagePickerControllerDelegate & UINavigationControllerDelegate*/ {
    
    
    // Variáveis de objetos
    @IBOutlet weak var pickerCategoriaRoupa: UIPickerView!
    
    // Variáveis lógicas
    
    let categoriasRoupa = ["Social","Inverno","Casual","Verão","Festa"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let anguloDeRotação = CGFloat(90 * (Double.pi/180))
        
        // Adicionando picker
        pickerCategoriaRoupa.transform = CGAffineTransform(rotationAngle: anguloDeRotação)
        
        pickerCategoriaRoupa.delegate = self
        pickerCategoriaRoupa.dataSource = self
        pickerCategoriaRoupa.selectRow(categoriasRoupa.count/2, inComponent: 0, animated: true)
    }
    
    // Configuração do PickerView das categorias de roupas
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoriasRoupa.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoriasRoupa[row]
    }
    
}


