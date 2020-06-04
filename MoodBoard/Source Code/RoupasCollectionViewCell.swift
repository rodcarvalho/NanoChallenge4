//
//  RoupasCollectionViewCell.swift
//  MoodBoard
//
//  Created by Rodrigo Barreto de Carvalho on 04/06/20.
//  Copyright © 2020 Jader e Rodrigo. All rights reserved.
//

import UIKit

class RoupasCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var highlightIndicator: UIView!
    @IBOutlet weak var selectIndicator: UIImageView!
    
    override var isHighlighted: Bool{
        didSet{
            highlightIndicator.isHidden = !isHighlighted
        }
    }
    
    override var isSelected: Bool{
        didSet{
            highlightIndicator.isHidden = !isSelected
            selectIndicator.isHidden = !isSelected
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
