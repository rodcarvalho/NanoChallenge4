//
//  RoupasCollectionViewCell.swift
//  MoodBoard
//
//  Created by Rodrigo Barreto de Carvalho on 02/06/20.
//  Copyright © 2020 Jader e Rodrigo. All rights reserved.
//

import UIKit

class RoupasCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var roupaIMG: UIImageView!

    func configure(with roupa: Roupa){
        
        roupaIMG.image = roupa.imagemRoupa
    }
}
