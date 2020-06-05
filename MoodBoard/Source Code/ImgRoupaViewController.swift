//
//  ImgRoupaViewController.swift
//  MoodBoard
//
//  Created by Rodrigo Barreto de Carvalho on 04/06/20.
//  Copyright © 2020 Jader e Rodrigo. All rights reserved.
//

import UIKit

class ImgRoupaViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var dadosRoupa: Roupa!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupImage()
    }
    
    private func setupImage(){
        guard let name = dadosRoupa else {return}
        
        //if let image = name.imagemRoupa{
            imageView.image = name.imagemRoupa //image
        //}
    }
    
}
