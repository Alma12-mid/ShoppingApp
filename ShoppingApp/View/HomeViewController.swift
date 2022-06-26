//
//  HomeViewController.swift
//  Shopping
//
//  Created by Alma Midhun on 17/06/22.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    var searchActive : Bool = false
   // var searchDidChange: Observer<String>?
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var viewModel = HomeViewModel()
    var data: [ShoppingData] = []
   // private var dataSource: [Value] = []
    var values: [Value] = []
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchUI()
        configureViewModel()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    
    
    
    private func configureViewModel() {
        viewModel.updateViewForCategories = { [weak self] (data) in
        if !data.isEmpty {
            self?.data = data
//            for type in data {
//               var dataType = type.type!
//                for value in type.values {
//             //       print(value.id!)
//                }
//            }
            self?.collectionView.reloadData()
        }
    }
    viewModel.fetchCategories()
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
    return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
    switch sectionNumber {
    case 0: return self.firstLayoutSection()
    case 1: return self.secondLayoutSection()
    default: return self.thirdLayoutSection()
        }
      }
    }
    
    private func firstLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
    let item = NSCollectionLayoutItem(layoutSize: itemSize) // Whithout badge
    item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.22), heightDimension:.fractionalWidth(0.3))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .groupPaging
    return section
    }
    
    private func secondLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.95),heightDimension: .estimated(181))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.89),heightDimension: .estimated(181))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = .init(top: 10, leading: 8, bottom: 15, trailing: 0)
   // section.contentInsets.leading = 15
    section.orthogonalScrollingBehavior = .continuous
    //section.boundarySupplementaryItems = [
   // NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension:.fractionalWidth(1), heightDimension: .estimated(44)), elementKind: categoryHeaderId, alignment:.topLeading)]
    return section
    }
    

    private func thirdLayoutSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),heightDimension: .fractionalWidth(0.79))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 8)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9),heightDimension: .estimated(284.69))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = .init(top: 0, leading: 8, bottom: 0, trailing: 0)
    section.orthogonalScrollingBehavior = .continuous
    return section
    }
    
    
    func searchUI() {
        searchBar.searchTextField.backgroundColor = UIColor(red: 250 / 255, green: 250 / 255, blue: 250 / 255, alpha: 1.0)
        searchBar.layer.cornerRadius = 10
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor(red: 229 / 255, green: 229 / 255, blue: 229 / 255, alpha: 1.0).cgColor
    }
    
    @objc private func updateSearch() {
        guard let searchText = searchBar.text else { return }
     //   searchDidChange?(searchText)
    }

    

    
}

extension HomeViewController: UISearchBarDelegate{
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
        searchBar.text = nil
        searchBar.resignFirstResponder()
      //  self.tableView.resignFirstResponder()
        self.searchBar.showsCancelButton = false
      //  self.tableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }

    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //    updateSearch()
        self.searchActive = true;
        self.searchBar.showsCancelButton = true
//        DispatchQueue.main.async { [weak self] in
//            self?.tableView.reloadData()
//        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 69, height: 69)
        }
    
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        for dataType in data {
//            print(dataType.type!)
            if dataType.type! == "category" {
                count = dataType.type?.count ?? 0
            }
            else if dataType.type! == "banners" {
                count = dataType.type?.count ?? 0
            }
            else {
                count = dataType.type?.count ?? 0
            }
        }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section{
        case 0: let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            for dataType in data {
                if dataType.type! == "category" {
                    cell.setImageFrom(urlString: dataType.values[indexPath.item].imageURL)
                    cell.categoryTitleName.text = dataType.values[indexPath.item].name
                }
            }
            return cell
        case 1: let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
            for dataType in data {
                if dataType.type! == "banners" {
                    cell.setImageFrom(urlString: dataType.values[indexPath.item].bannerURL)
                }
            }
            return cell
        default: let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
            for dataType in data {
                if dataType.type! == "products" {
                    print(dataType.values[indexPath.item].name ?? "")
                    let strikeOfferPrice = dataType.values[indexPath.item].offerPrice!
                    let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: strikeOfferPrice)
                    attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
                    cell.setImageFrom(urlString: dataType.values[indexPath.item].image)
                    cell.productTitleName.text = dataType.values[indexPath.item].name
                    cell.productActualPrice.text = dataType.values[indexPath.item].actualPrice
                    cell.productOfferPrice.attributedText = attributeString
                    if dataType.values[indexPath.item].isExpress == false {
                        cell.expressDelivery.isHidden = true
                    }
                    if dataType.values[indexPath.item].offer! > 0 {
                        cell.offer.text = dataType.values[indexPath.item].offer?.description ?? ""
                    }
                    if dataType.values[indexPath.item].offerPrice == dataType.values[indexPath.item].actualPrice {
                        cell.productOfferPrice.isHidden = true
                    }
                }
            }
            return cell
        }
    }         
        
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      //  onSelection?(viewModel[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
}


extension UICollectionView {
func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T {
    let identifier = String(describing: T.self)
    return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! T
}
}




