//
//  RoupasViewController.swift
//  MoodBoard
//
//  Created by Rodrigo Barreto de Carvalho on 04/06/20.
//  Copyright © 2020 Jader e Rodrigo. All rights reserved.
//

import UIKit

//Estrutura da Roupa para teste
struct Roupa {
    var imageName: String
}

class RoupasViewController: UIViewController {
    
    enum Mode{
        case view
        case select
        
    }
    @IBOutlet weak var collectionView: UICollectionView! //linka a Collection View do Storyboard
    
    var roupas: [Roupa] = [Roupa(imageName: "image1"),
                           Roupa(imageName: "image2"),
                           Roupa(imageName: "image2"),
                           Roupa(imageName: "image3"),
                           Roupa(imageName: "image4"),
                           Roupa(imageName: "image3"),
                           Roupa(imageName: "image4"),
                           Roupa(imageName: "image5")]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout! //define a variável de FlowLayout da collection
    let cellIdentifier = "RoupasCollectionViewCell" //guarda a string de identifier da célula
    let viewImageSegueIdentifier = "viewImageSegueIdentifier" //guarda a string de identifier do Segue
    
    var mMode: Mode = .view{
        didSet{
            switch mMode {
            case .view:
                for (key, value) in dictionarySelectedIndexPath{
                    if value{
                        collectionView.deselectItem(at: key, animated: true)
                    }
                }
                
                dictionarySelectedIndexPath.removeAll()
                selectBarButton.title = "Select"
                navigationItem.leftBarButtonItem = nil
                collectionView.allowsMultipleSelection = false
            case.select:
                selectBarButton.title = "Cancel"
                navigationItem.leftBarButtonItem = deleteBarButton
                collectionView.allowsMultipleSelection = true
            }
        }
    }
    
    
    lazy var selectBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(didsSelectButtonClicked(_sender:)))
        return barButtonItem
    }()
    
    lazy var deleteBarButton: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didsDeleteButtonClicked(_sender:)))
        return barButtonItem
    }()
    
    var dictionarySelectedIndexPath : [IndexPath:Bool] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBarButtonItens()
        setupCollectionView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let roupa = sender as! Roupa
        
        if segue.identifier == viewImageSegueIdentifier{
            if let vc = segue.destination as? ImgRoupaViewController{
                vc.imageName = roupa.imageName
                
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupColletionViewItenSize()
    }
    
    private func setupBarButtonItens() {
        navigationItem.rightBarButtonItem = selectBarButton
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "RoupasCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupColletionViewItenSize(){
        if collectionViewFlowLayout == nil{
            let numberOfItemPerRow: CGFloat = 3
            let lineSpacing: CGFloat = 5
            let interItemSpacing: CGFloat = 5
            
            let width = (collectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
            
        }
    }
    
    @objc func didsSelectButtonClicked(_sender: UIBarButtonItem ){
        mMode = mMode == .view ? .select : .view
    }
    
    @objc func didsDeleteButtonClicked(_sender: UIBarButtonItem ){
        var deleteNeededIndexPaths: [IndexPath] = []
        for (key, value) in dictionarySelectedIndexPath{
            if value {
                deleteNeededIndexPaths.append(key)
            }
        }
        
        for i in deleteNeededIndexPaths.sorted(by: {$0.item > $1.item}){
            roupas.remove(at: i.item)
        }
        
        collectionView.deleteItems(at: deleteNeededIndexPaths)
        dictionarySelectedIndexPath.removeAll()
    }
}

extension RoupasViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return roupas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! RoupasCollectionViewCell
        
        cell.imageView.image = UIImage(named: roupas[indexPath.item].imageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch mMode {
        case .view:
            let roupa = roupas[indexPath.item]
            performSegue(withIdentifier: viewImageSegueIdentifier, sender: roupa)
            collectionView.deselectItem(at: indexPath, animated: true)
        case .select:
            dictionarySelectedIndexPath[indexPath] = true
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if mMode == .select{
            dictionarySelectedIndexPath[indexPath] = false
        }
    }
}
