//
//  SearchViewController.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/06.
//

import UIKit

class SearchViewController: UIViewController,  UISearchBarDelegate, UIGestureRecognizerDelegate {
    
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
    
    // 키보드 search 버튼 클릭시 데이터 전달
    @objc func searchBtnClicked() {
        let vc = SearchListViewController()
        navigationController?.pushViewController(vc, animated: true)
        
        
        vc.vcTitle = searchController.searchBar.text ?? ""
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
        guard let text = searchController.searchBar.text else { return }
        searchBtnClicked()
        
//        if text.isEmpty {
//            self.view.makeToast(
//        }
        print("search result : ", text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // 검색값이 비어있을 때 자동적으로 포커싱 해제(키보드 내려감)
        if(searchText.isEmpty) {
            // 검색바에 x를 누를 때는 포커싱해제가 안되서 아래를 이용하여 딜레이를 줌
            DispatchQueue.main.asyncAfter(deadline: .now()+0.01, execute:{ searchBar.resignFirstResponder()})
             // 포커싱 해제
        }

    }
}

extension SearchViewController {
    func configureNavbar() {
        
//        var image = UIImage(named: "myReform_logo")?.resize(newWidth: 150)
//        image = image?.withRenderingMode(.alwaysOriginal) //색깔 원래대로
//        let imageBtn = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
//        let categoryBtn = UIBarButtonItem(image: UIImage(named: "category")?.resize(newWidth: 25), style: .done, target: self, action: #selector(categoryBtnClicked))
//        let uploadBtn = UIBarButtonItem(image: UIImage(named: "upload")?.resize(newWidth: 25), style: .done, target: self, action: #selector(uploadBtnClicked))
            
//        self.navigationItem.leftBarButtonItem = imageBtn
//        self.navigationItem.rightBarButtonItems = [categoryBtn, uploadBtn]
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .label
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
