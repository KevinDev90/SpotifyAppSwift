//
//  PlaylistCollectionViewController.swift
//  SpotifyApp
//
//  Created by Kevin Guzman on 11/09/23.
//

import UIKit

private let reuseIdentifier = "Cell"

class CustomCollectionViewLayout: UICollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        // Configura el espacio entre las celdas (margen horizontal y vertical)
        let margin: CGFloat = 10
        minimumInteritemSpacing = margin
        minimumLineSpacing = margin
        
        // Calcula el ancho de las celdas basado en el tamaño del collectionView y el margen
        let availableWidth = collectionView.bounds.width - margin * 3 // 3 márgenes en total (izquierda, derecha, entre columnas)
        let cellWidth = availableWidth / 2 // 2 columnas
        
        // Configura el tamaño de las celdas
        itemSize = CGSize(width: cellWidth, height: 60) // 100 es la altura deseada de las celdas
        
        // Configura la dirección de desplazamiento del collectionView (vertical)
        scrollDirection = .vertical
    }
}


class PlaylistCollectionViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.backgroundColor = .systemBackground
        
        // Do any additional setup after loading the view.
        
        self.collectionView.collectionViewLayout = CustomCollectionViewLayout()
        
        let margin: CGFloat = 10 // El margen deseado
        collectionView.contentInset = UIEdgeInsets(top: margin, left: margin, bottom: 0, right: margin)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        
        cell.backgroundColor = .systemGreen
        return cell
    }
}
