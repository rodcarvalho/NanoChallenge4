//
//  ImgRoupaViewController.swift
//  MoodBoard
//
//  Created by Rodrigo Barreto de Carvalho on 04/06/20.
//  Copyright © 2020 Jader e Rodrigo. All rights reserved.
//

import UIKit

class ImgRoupaViewController: UIViewController {
    
    @IBOutlet weak var nomeRoupa: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tipoRoupa: UILabel!
    @IBOutlet weak var categoriaRoupa: UILabel!
    
    var dadosRoupa: Roupa!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRoupa()
    }
    
    private func setupRoupa(){
        guard let roupa = dadosRoupa else {return}
        
        imageView.image = roupa.imagemRoupa
        nomeRoupa.text = roupa.nomeRoupa
        tipoRoupa.text = roupa.tipoRoupa
        categoriaRoupa.text = roupa.categoriaRoupa[0]
        
        for indexroupa in 1..<roupa.categoriaRoupa.count{
            categoriaRoupa.text! += " - \(roupa.categoriaRoupa[indexroupa])"
        }
    }
    
}
