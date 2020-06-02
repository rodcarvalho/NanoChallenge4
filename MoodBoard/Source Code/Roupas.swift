//
//  Roupas.swift
//  MoodBoard
//
//  Created by Rodrigo Barreto de Carvalho on 02/06/20.
//  Copyright © 2020 Jader e Rodrigo. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class Roupa {
    
    public var idRoupa: Int?
    public var nomeRoupa: String?
    public var tipoRoupa: String?
    public var imagemRoupa: UIImage?
    
    init(idRoupa: Int, nomeRoupa: String, tipoRoupa: String, imagemRoupa: UIImage) {
        self.idRoupa = idRoupa
        self.nomeRoupa = nomeRoupa
        self.tipoRoupa = tipoRoupa
        self.imagemRoupa = imagemRoupa
    }
}


