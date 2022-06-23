//
//  ProductsCollectionViewCell.swift
//  Shopping
//
//  Created by Alma Midhun on 18/06/22.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productBackgroundView: UIView!
    @IBOutlet weak var offer: UILabel!
    @IBOutlet weak var wishList: UIImageView!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var expressDelivery: UIImageView!
    @IBOutlet weak var productOfferPrice: UILabel!
    @IBOutlet weak var productActualPrice: UILabel!
    @IBOutlet weak var productTitleName: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        clipsToBounds = true
        productBackgroundView?.clipsToBounds = true
        productBackgroundView?.contentMode = .scaleAspectFill
        productBackgroundView?.layer.borderWidth = 1
        productBackgroundView?.layer.borderColor = UIColor(red: 237 / 255, green: 237 / 255, blue: 237 / 255, alpha: 1.0).cgColor
    }
    
    func setImageFrom(urlString: String?) {
        if let urlString = urlString,
           let url = URL(string: urlString) {
            productImage.sd_setImage(with: url, completed: nil)
        }
    }
}
