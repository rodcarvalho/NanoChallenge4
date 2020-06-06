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


class MoodBoardViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource/*, UIImagePickerControllerDelegate & UINavigationControllerDelegate*/ {
    
    
    // Variáveis de objetos
    @IBOutlet weak var pickerCategoriaRoupa: UIPickerView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    // Variáveis lógicas
    
    let ImagensExemplo = [UIImage(named: "image1"),
                          UIImage(named: "image2"),
                          UIImage(named: "image3"),
                          UIImage(named: "image4"),
                          UIImage(named: "image5")]
    
    let categoriasRoupa = ["Social","Inverno","Casual","Verão","Festa"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Foi")
        return ImagensExemplo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IdentificadorMood", for: indexPath) as! MoodBoardViewCell
        cell.imagem.image = ImagensExemplo[indexPath.item]
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.reloadData()
        
        /*
        if let layout = collectionView?.collectionViewLayout as? MoodBoard{
            layout.delegate = self
            print("Foi?")
        }
 
        */
        
        
        let anguloDeRotação = CGFloat(90 * (Double.pi/180))
        
        let y = pickerCategoriaRoupa.frame.origin.y
        // Adicionando picker
        pickerCategoriaRoupa.transform = CGAffineTransform(rotationAngle: anguloDeRotação)
        
        pickerCategoriaRoupa.frame = CGRect(x: -100, y: y, width: view.frame.width+200, height: 100)
        
        pickerCategoriaRoupa.delegate = self
        pickerCategoriaRoupa.dataSource = self
        pickerCategoriaRoupa.selectRow(categoriasRoupa.count/2, inComponent: 0, animated: true)
        
        print(categoriasRoupa[pickerCategoriaRoupa.selectedRow(inComponent: 0)])
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
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 115
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let viewPicker = UIView()
        viewPicker.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.text = categoriasRoupa[row]
        viewPicker.addSubview(label)
        
        viewPicker.transform = CGAffineTransform(rotationAngle: (-90*(.pi/180)))
        
        return viewPicker
    }
}


extension MoodBoardViewController: MoodBoardDelegate{

    func collectionView(_ collectionView: UICollectionView, tamanhoImagem indexPath: IndexPath) -> CGFloat {
        return (ImagensExemplo[indexPath.item]?.size.height)!
    }
}

