//
//  RecommendedCollectionViewController.swift
//  SpotifyApp
//
//  Created by Kevin Guzman on 11/09/23.
//

import UIKit

private let reuseIdentifier = "Cell2"

//class CustomCollectionViewLayout2: UICollectionViewFlowLayout {
//    override func prepare() {
//        super.prepare()
//        
//        guard let _ = collectionView else { return }
//        scrollDirection = .horizontal
//
//        // Configura el espacio entre las celdas (margen horizontal y vertical)
//        let margin: CGFloat = 10
//        minimumInteritemSpacing = margin
//        
//        // Configura el tamaño de las celdas
//        itemSize = CGSize(width: 150, height: 150)
//        sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
//    }
//}

class RecommendedCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        self.collectionView.dataSource = self
//        self.collectionView.delegate = self
//        self.collectionView.backgroundColor = .systemBackground
//        // Do any additional setup after loading the view.
//        
//        self.collectionView.collectionViewLayout = CustomCollectionViewLayout2()
//        
//        let margin: CGFloat = 10 // El margen deseado
//        collectionView.contentInset = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: 0)
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 8
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .systemBlue
        return cell
    }
}
