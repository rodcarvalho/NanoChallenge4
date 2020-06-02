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
    var DataSource: [[Roupa]] = [[]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Chamada da função que instancia cada uma das dicas e retorna elas num array
        DataSource = bd.CarregarTodasRoupas()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(DataSource.count)
        return DataSource.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
               
               if let RoupasCell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoupaCell", for: indexPath) as? RoupasCollectionViewCell {
                   
                   RoupasCell.configure(with: DataSource[indexPath.row][3])
           
                   cell = RoupasCell
               }
               return cell
    
    }
      


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
