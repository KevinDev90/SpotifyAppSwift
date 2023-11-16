//
//  MyCustomCollectionViewCell.swift
//  CollectionViews
//
//  Created by Kevin Guzman on 27/07/23.
//

import UIKit

class CustomCellPlaylist: UICollectionViewCell {
    static let identifier = "CustomCellPlaylist"
    
    private let playlistCoverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let playlistNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(playlistCoverImageView)
        contentView.addSubview(playlistNameLabel)
        contentView.clipsToBounds = true
        
        layer.cornerRadius = 4
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playlistNameLabel.frame = CGRect(
            x: 0,
            y: contentView.heigth - 40,
            width: contentView.width,
            height: 44
        )
        
        playlistCoverImageView.frame = CGRect(
            x: 0,
            y: 0,
            width: contentView.width,
            height: contentView.heigth - 40
        )
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playlistCoverImageView.image = nil
        playlistNameLabel.text = nil
    }
    
    
    func configure(with viewModel: FeaturedPlaylistCellViewModel) {
        playlistNameLabel.text = "\(viewModel.creatorName) \(viewModel.name)"
        playlistCoverImageView.sd_setImage(with: viewModel.artworkURL, completed: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
