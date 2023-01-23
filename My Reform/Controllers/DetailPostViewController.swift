//
//  DetailPostViewController.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/22.
//

import UIKit
import SnapKit
import Then
import Alamofire

// 테이블 뷰에서 셀 클릭 시 넘어오는 뷰로 클릭했던 data의 indexPath 값을 이 뷰로 전송

class DetailPostViewController: UIViewController {
    
    // 0123 게시물의 상세정보 불러오는 모델로 변경해야함
    var detailPostModel : AllPostModel!

    private let imageTableView: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
        //Views 에있는 CollectionViewTabelCell 호출
        table.register(DetailPostCollectionViewCell.self, forCellReuseIdentifier: DetailPostCollectionViewCell.identifier)
        return table
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUIView()
        setUIConstraints()
        setupDetailPostData()
        
        imageTableView.delegate = self
        imageTableView.dataSource = self
    }
    
    // 서버와의 연동으로 데이터 매니저에서 정보가져오는 매니저를 만들어야함 []
    private func setupDetailPostData() {
//        Manager().allPostGet(self)
    }

    private func setUIView() {
        view.addSubview(imageTableView)
    }
    
    private func setUIConstraints() {
        imageTableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(500)
            make.width.equalToSuperview()
        }
    }
    
    
}

extension DetailPostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailPostCollectionViewCell.identifier, for: indexPath) as? DetailPostCollectionViewCell else { return UITableViewCell() }
        
        // cell 에서 configure로 컬렉션뷰 셀을 가져옴 - 컬렉션 뷰에는
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
}





#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
  }
  @available(iOS 13.0.0, *)
  func makeUIViewController(context: Context) -> some UIViewController {
      DetailPostViewController()
  }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
  static var previews: some View {
    Group {
        SearchViewControllerRepresentable()
        .ignoresSafeArea()
        .previewDisplayName("Preview")
        .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
  }
} #endif
