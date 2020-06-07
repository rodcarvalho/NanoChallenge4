//
//  MoodBoard.swift
//  MoodBoard
//
//  Created by Jader Gedeon on 05/06/20.
//  Copyright © 2020 Jader e Rodrigo. All rights reserved.
//

/*

import UIKit

protocol MoodBoardDelegate: AnyObject {
    func collectionView(_ collectionView: UICollectionView, tamanhoImagem indexPath: IndexPath) -> CGFloat
}

class MoodBoard: UICollectionViewLayout {
    
    weak var delegate: MoodBoardDelegate?
    
    var numeroDeColunas = 2
    var espacamentoEntreImagens: CGFloat = 3
    
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var alturaDoConteudo: CGFloat = 0
    
    fileprivate var larguraDoConteudo: CGFloat {
        guard let collectionView = collectionView else{
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        print("Até aqui foi")
        return CGSize(width: larguraDoConteudo, height: alturaDoConteudo)
    }
    
    
    
    
    @IBOutlet weak var calca: UIImageView!
    override func prepare() {
        print("Aqui tb")
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
        
        print(collectionView.numberOfItems(inSection: 0))
        
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: item, section: 0)
            
            let alturaDaImagem = delegate?.collectionView(collectionView, tamanhoImagem: indexPath) ?? 1
            
            let alturaCelula = espacamentoEntreImagens * 2 + 180//alturaDaImagem
            @IBOutlet weak var acessorio: UIImageView!
            @IBOutlet weak var cabeca: UIImageView!
            @IBOutlet weak var cabeca: UIImageView!
            
            let frame = CGRect(x: xOffset[coluna], y: yOffset[coluna], width: larguraDaColuna, height: alturaCelula)
            let inserirFrame = frame.insetBy(dx: espacamentoEntreImagens, dy: espacamentoEntreImagens)
            
            let atributos = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            atributos.frame = inserirFrame
            cache.append(atributos)
            print(cache)
            
            alturaDoConteudo = max(alturaDoConteudo, frame.maxY)
            yOffset[coluna] = yOffset[coluna] + alturaCelula
            
            coluna = coluna < (numeroDeColunas-1) ? (coluna + 1) : 0
        }
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var atributosDeLayoutVisiveis: [UICollectionViewLayoutAttributes] = []
        print("Foi aquiiii")
        
        for atributos in cache {
            if atributos.frame.intersects(rect) {
            atributosDeLayoutVisiveis.append(atributos)
            }
        }
        
        return atributosDeLayoutVisiveis
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        print("Tamo quase")
        return cache[indexPath.item]
    }
    
}
*/
