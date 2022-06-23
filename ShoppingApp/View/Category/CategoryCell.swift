//
//  CategoryCell.swift
//  Shopping
//
//  Created by Alma Midhun on 17/06/22.
//

import Foundation
import UIKit
import SDWebImage

final class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryBackgroundView: UIView!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitleName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        clipsToBounds = true
        layer.cornerRadius = 70/2
        categoryBackgroundView?.clipsToBounds = true
        categoryBackgroundView?.layer.cornerRadius = layer.cornerRadius
        categoryBackgroundView?.contentMode = .scaleAspectFill
        categoryBackgroundView?.backgroundColor = .blue
    }
    
    func setImageFrom(urlString: String?) {
        if let urlString = urlString,
           let url = URL(string: urlString) {
            categoryImage.sd_setImage(with: url, completed: nil)
        }
    }
    
}
