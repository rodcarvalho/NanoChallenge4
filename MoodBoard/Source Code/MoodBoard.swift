//
//  MoodBoard.swift
//  MoodBoard
//
//  Created by Jader Gedeon on 05/06/20.
//  Copyright © 2020 Jader e Rodrigo. All rights reserved.
//

import UIKit

protocol MoodBoardDelegate: class {
    func collectionView(_ collectionView: UICollectionView, tamanhoImagem indexPath: IndexPath) -> CGSize
}

class MoodBoard: UICollectionViewLayout {
    
    weak var delegate: MoodBoardDelegate!
    
    var numeroDeColunas = 2
    var espacamentoEntreImagens = 3
    
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var alturaDoConteudo: CGFloat = 0
    
    fileprivate var larguraDoConteudo: CGFloat {
        guard let collectionView = collectionView else{
            return 0
        }
        
        return collectionView.bounds.width
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: larguraDoConteudo, height: alturaDoConteudo)
    }
    
    override func prepare() {
        guard cache.isEmpty, let collectionView = collectionView else {
            return
        }
        
        let larguraDaColuna = larguraDoConteudo / CGFloat(numeroDeColunas)
        var xOffset = [CGFloat]()
        for coluna in 0..<numeroDeColunas {
            xOffset.append(CGFloat(coluna)*larguraDaColuna)
        }
        
        var coluna = 0
        var yOffset = [CGFloat](repeating: 0, count: numeroDeColunas)
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: item, section: 0)
            
            //PHOTOSIZE
            
        }
        
    }
    
}
