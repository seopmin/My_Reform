//
//  HomeViewController.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/06.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    private let homeFeedTable: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
        //Views 에있는 CollectionViewTabelCell 호출
        table.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        configureNavbar()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
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
        var image = UIImage(named: "myReform_logo")
        image = image?.withRenderingMode(.alwaysOriginal) //색깔 원래대로
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "bell"), style: .done, target: self, action: #selector(notiBtnClicked)),
            UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .done, target: self, action: #selector(categoryBtnClicked))
        ]
        navigationController?.navigationBar.tintColor = .label
    }
    
    @objc func categoryBtnClicked() {
        let vc = CategoryViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func notiBtnClicked() {
        let vc = NotificationViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        cell.titleCellImageView = UIImageView(image: UIImage(systemName: "heart"))
        cell.titleCellLabel.text = "숫자 커스텀 알람시계"
        cell.minuteCellLabel.text = "5분 전"
        cell.priceCellLabel.text = "30,000 원"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
}
