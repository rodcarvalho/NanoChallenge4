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
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupImage()
    }
    
    private func setupImage(){
        guard let name = imageName else {return}
        
        if let image = UIImage(named: name){
            imageView.image = image
        }
    }
    
}
