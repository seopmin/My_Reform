//
//  HomeViewController.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/06.
//

import UIKit
import SnapKit
import Alamofire

class HomeViewController: UIViewController {
    
    var allPostModel: [AllPostModel] = []{
        didSet {
            self.homeFeedTable.reloadData()
        }
    }

    private let homeFeedTable: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
        //Views 에있는 CollectionViewTabelCell 호출
        table.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavbar()
        
        view.backgroundColor = .white
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        
        
        homeFeedTable.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
    
    }
    
    
    @objc func categoryBtnClicked() {
        let vc = CategoryViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func uploadBtnClicked() {
        let vc = UploadViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    // 데이터 새로고침
//    private func fetchUpcoming() {
//        APICaller.shared.메소드이름 { [weak self] result in
//            switch result {
//            case .success(let titles):
//                self?.titles = titles
//                DispatchQueue.main.async {
//                    self?.homeFeedTable.reloadData()
//                }
//            case.failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    
    //상단 네비게이션바
    func configureNavbar() {
        
        var image = UIImage(named: "myReform_logo")?.resize(newWidth: 150)
        image = image?.withRenderingMode(.alwaysOriginal) //색깔 원래대로
        let imageBtn = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        let categoryBtn = UIBarButtonItem(image: UIImage(named: "category")?.resize(newWidth: 25), style: .done, target: self, action: #selector(categoryBtnClicked))
        let uploadBtn = UIBarButtonItem(image: UIImage(named: "upload")?.resize(newWidth: 25), style: .done, target: self, action: #selector(uploadBtnClicked))
            
        self.navigationItem.leftBarButtonItem = imageBtn
        self.navigationItem.rightBarButtonItems = [categoryBtn, uploadBtn]
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .label
    }
    
    // AllPostDataManager 에서 데이터를 불러오는데 성공하면 실행되는 함수
    func successAllPostModel(result: [AllPostModel]) {
        // 불러온 값을 위에 전역변수로 저장
        allPostModel = result
    }
    
}



//MARK: -- TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        let data = allPostModel[indexPath.row]
        // 01.20 테스트 [x] - 오류시 cell.의 값을 하나하나 지정
        cell.configure(with: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    //상단 네비게이션바가  스크롤하면 같이 올라가게 만듬
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let defaultOffset = view.safeAreaInsets.top
//        let offset = scrollView.contentOffset.y + defaultOffset
//
//        navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
//    }
}
