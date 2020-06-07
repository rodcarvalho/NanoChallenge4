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

struct item {
    var imagem : UIImage
}


class MoodBoardViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{ //MoodBoardDelegate/*, UIImagePickerControllerDelegate & UINavigationControllerDelegate*/ {
    
    
    // Variáveis de objetos
    @IBOutlet weak var pickerCategoriaRoupa: UIPickerView!
    
    @IBOutlet weak var botaoGerarMoodBoard: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    // Variáveis lógicas
    
    var procBD = ProcedimentosBD()
    
    var collectionViewLayout: UICollectionViewLayout!
    
    let identificadorDeCelulas = "IdentificadorMood"
    
    var DataSource: [UIImage] = []
    
    let categoriasRoupa = ["Social","Esportiva","Casual","Festa"]
    
    @IBOutlet weak var cabeca: UIImageView!
    @IBOutlet weak var torso: UIImageView!
    @IBOutlet weak var calca: UIImageView!
    @IBOutlet weak var acessorio: UIImageView!
    @IBOutlet weak var calcado: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setupCollectionView()
        
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
    
    // BOTAO
    
    @IBAction func SelecionarLook(_ sender: Any) {
        
        DataSource = procBD.selecionarLook(categoria: categoriasRoupa[pickerCategoriaRoupa.selectedRow(inComponent: 0)])
        
        cabeca.image = DataSource[0]
        acessorio.image = DataSource[1]
        torso.image = DataSource[2]
        calcado.image = DataSource[3]
        calca.image = DataSource[4]
        
        
        
        //collectionView.reloadData()
        
    }
    
    
    
    
 /*
    
    //MOODBOARD
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "MoodBoardViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: identificadorDeCelulas)
    }
}


extension MoodBoardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identificadorDeCelulas, for: indexPath) as! MoodBoardViewCell
        cell.imagem.image = DataSource[indexPath.item].imagem
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Item selecionado: \(indexPath)")
    }
}



extension MoodBoardViewController: MoodBoardDelegate{

    func collectionView(_ collectionView: UICollectionView, tamanhoImagem indexPath: IndexPath) -> CGFloat {
        return (DataSource[indexPath.item].imagem.size.height)
    }
}

*/
}
