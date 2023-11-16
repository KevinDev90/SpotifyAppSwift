//
//  CustomCollectionViewCell.swift
//  SpotifyApp
//
//  Created by Kevin Guzman on 12/09/23.
//

import UIKit
import SDWebImage

class CustomCellTracks: UICollectionViewCell {
    static let identifier = "CustomCellTracks"
    
    private let trackCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let trackNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(trackCoverImageView)
        contentView.addSubview(trackNameLabel)
        contentView.addSubview(artistNameLabel)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        trackCoverImageView.frame = CGRect(
            x: 0,
            y: 0,
            width: 50,
            height: contentView.heigth
        )
        
        trackNameLabel.frame = CGRect(
            x: trackCoverImageView.width + 10,
            y: 5,
            width: contentView.width - 10,
            height: 25
        )
        
        artistNameLabel.frame = CGRect(
            x: trackCoverImageView.width + 10,
            y: trackNameLabel.heigth,
            width: contentView.width - 10,
            height: 25
        )

        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        trackNameLabel.text = nil
        artistNameLabel.text = nil
        trackCoverImageView.image = nil
    }
    
    func configure(with viewModel: RecommendedTrackCellViewModel) {
        trackNameLabel.text = viewModel.name
        artistNameLabel.text = viewModel.artistName
                
        if let image = viewModel.artworkURL {
            trackCoverImageView.sd_setImage(with: image, completed: nil)
        } else {
            let image = UIImage(systemName: "music.note.list")
            trackCoverImageView.image = image
            
            let greenWithOpacity = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 0.2)
            trackCoverImageView.tintColor = greenWithOpacity
        }

    }

    override func awakeFromNib() {
        super.awakeFromNib()        
        // Initialization code
    }
}

extension UIImage {
    func resized(to newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(origin: .zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? self
    }
}
