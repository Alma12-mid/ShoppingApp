//
//  HomeViewModel.swift
//  Shopping
//
//  Created by Alma Midhun on 18/06/22.
//

import Foundation

class HomeViewModel {
        
    var error: FDError? {
        didSet { self.showError?(error) }
    }
    
    var isFetching: Bool? {
        didSet { self.updateLoaderStatus?(isFetching) }
    }
    
    //MARK: Binding methods
    var updateViewForCategories: ((_ ShoppingData: [ShoppingData]) -> ())?
    var updateViewForBanners: ((_ ShoppingData: [ShoppingData]) -> ())?
    var updateViewForProducts: ((_ ShoppingData: [ShoppingData]) -> ())?
    var updateLoaderStatus: ((_ status: Bool?)->())?
    var showError: ((_ error: FDError?)->())?
    
        
    func fetchCategories() {
        getCategoriesAvailable { [weak self] (result) in
            print(result)
            self?.isFetching = false
            switch result {
            case .success(let shopping):
               // if shopping.type == "category" {
                let categories = shopping.homeData
                self?.updateViewForCategories?(categories)
             //   print(shopping.homeData)
                
                
                
               // }
            case .failure(let error):
                self?.error = error
            }
        }
    }
    
    func fetchBanners() {
        getBannersAvailable { [weak self] (result) in
            self?.isFetching = false
            switch result {
            case .success(let shopping):
             //   if shopping.type == "banners"{
                let banners = shopping.homeData
                self?.updateViewForBanners?(banners)
              //  }
            case .failure(let error):
                self?.error = error
            }
        }
    }
    
    
    func fetchProducts() {
        getProductsAvailable { [weak self] (result) in
            self?.isFetching = false
            switch result {
            case .success(let shopping):
               // if shopping.type == "banners"{
                let products = shopping.homeData
                self?.updateViewForProducts?(products)
              //  }
            case .failure(let error):
                self?.error = error
            }
        }
    }
    
    
    
    
    
    //MARK:- API calls
    private func getCategoriesAvailable(completion: @escaping (Result <Shopping, FDError>) -> Void) {
        isFetching = true
        NetworkManager
            .request(route: HomeAPIRouter.getCategories, completion: completion)
    }
    
    private func getBannersAvailable(completion: @escaping (Result <Shopping, FDError>) -> Void) {
        isFetching = true
        NetworkManager
            .request(route: HomeAPIRouter.getBanners, completion: completion)
    }
    
    private func getProductsAvailable(completion: @escaping (Result <Shopping, FDError>) -> Void) {
        isFetching = true
        NetworkManager
            .request(route: HomeAPIRouter.getProducts, completion: completion)
    }
}
