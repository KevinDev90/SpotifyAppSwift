//
//  Custom2CollectionViewCell.swift
//  SpotifyApp
//
//  Created by Kevin Guzman on 12/09/23.
//

import UIKit
import SDWebImage

class CustomCellReleases: UICollectionViewCell {
    static let identifier = "CustomCellReleases"
    
    private let albumCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(albumCoverImageView)
        contentView.addSubview(albumNameLabel)
        contentView.clipsToBounds = true
        
        layer.cornerRadius = 4
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        albumNameLabel.sizeToFit()
        
        let imageSize: CGFloat = contentView.heigth
        let albumLabelSize = albumNameLabel.sizeThatFits(CGSize(width: contentView.width - imageSize - 10, height: imageSize))
        
        // Image
        albumCoverImageView.frame = CGRect(x: 0, y: 0, width: imageSize, height: imageSize)
        
        // Name
        let albumLabelHeight = min(60, albumLabelSize.height)
        albumNameLabel.frame = CGRect(x: albumCoverImageView.right + 10, y: 23, width: albumLabelSize.width, height: albumLabelHeight)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        albumNameLabel.text = nil
        albumCoverImageView.image = nil
    }
    
    func configure(with viewModel: NewReleasesCellViewModel) {
        albumNameLabel.text = viewModel.name
        albumCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }
    
}
