//
//  RoupasViewController.swift
//  MoodBoard
//
//  Created by Rodrigo Barreto de Carvalho on 01/06/20.
//  Copyright © 2020 Jader e Rodrigo. All rights reserved.
//

import UIKit
import CoreData

class RoupasViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    var bd = ProcedimentosBD()
    var DataSource: [Roupa] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        //Chamada da função que instancia cada uma das dicas e retorna elas num array
        //bd.apagarTodosRegistros()
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        DataSource = bd.CarregarTodasRoupas()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Check")
        print(DataSource.count)
        return DataSource.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
               
               if let RoupasCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoupaCell", for: indexPath) as? RoupasCollectionViewCell {
                   
                   RoupasCell.configure(with: DataSource[indexPath.row])
           
                   cell = RoupasCell
               }
               return cell
    }
}
extension RoupasViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        print("Entrou")
      
        DataSource = bd.CarregarRoupas(input: searchController.searchBar.text ?? "")
        
        
    }
}

