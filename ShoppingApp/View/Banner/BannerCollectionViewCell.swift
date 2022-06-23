//
//  BannerCollectionViewCell.swift
//  Shopping
//
//  Created by Alma Midhun on 18/06/22.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerBackgroundView: UIView!
    @IBOutlet weak var bannerImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        clipsToBounds = true
        bannerBackgroundView?.clipsToBounds = true
        bannerBackgroundView?.contentMode = .scaleAspectFill
        bannerBackgroundView?.layer.cornerRadius = 5
    }
    
    func setImageFrom(urlString: String?) {
        if let urlString = urlString,
           let url = URL(string: urlString) {
            bannerImage.sd_setImage(with: url, completed: nil)
        }
    }
    
    
    
    
    
    
    
    
}
