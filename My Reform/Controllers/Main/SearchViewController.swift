//
//  SearchViewController.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/06.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    private let searchController = UISearchController(searchResultsController: nil)
    private let refreshControl = UIRefreshControl()
    private let collectionViewLayout = UICollectionViewFlowLayout()
    private lazy var exploreCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attribute()
        layout()
        
    }
    


}

extension SearchViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath)
        cell.backgroundColor = [.systemGray, .systemGray2, .systemGray3, .systemGray4, .systemGray5, .systemGray6].randomElement()
        return cell
    }
}

extension SearchViewController {
    // 새로고침
    @objc func beginRefresh(_ sender: UIRefreshControl) {
        print("beginRefresh!")
        sender.endRefreshing()
    }
}

extension SearchViewController {
    func attribute() {
        view.backgroundColor = .systemBackground
        
        navigationController?.hidesBarsOnSwipe = true
        
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "검색"
        searchController.searchResultsUpdater = self
        navigationItem.titleView = searchController.searchBar
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        

        refreshControl.addTarget(self, action: #selector(beginRefresh(_:)), for: .valueChanged)
        exploreCollectionView.refreshControl = refreshControl
        
        exploreCollectionView.dataSource = self
        exploreCollectionView.delegate = self
        exploreCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        
    }
    func layout() {
        view.addSubview(exploreCollectionView)
        exploreCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension SearchViewController : UISearchResultsUpdating, UISearchControllerDelegate  {

    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else{return}
        print(text)
    }

    // when clicked searchButton in keyboard
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let text = searchController.searchBar.text?.lowercased() else { return }
        print("search result : ", text)
    }
}



#if DEBUG
import SwiftUI
struct SearchViewControllerRepresentable: UIViewControllerRepresentable {
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
  }
  @available(iOS 13.0.0, *)
  func makeUIViewController(context: Context) -> some UIViewController {
      SearchViewController()
  }
}
@available(iOS 13.0, *)
struct SearchViewControllerRepresentable_PreviewProvider: PreviewProvider {
  static var previews: some View {
    Group {
        SearchViewControllerRepresentable()
        .ignoresSafeArea()
        .previewDisplayName("Preview")
        .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
  }
} #endif
