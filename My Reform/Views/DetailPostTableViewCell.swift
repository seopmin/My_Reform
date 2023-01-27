//
//  DetailPostCollectionViewCell.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/22.
//

import UIKit
import SnapKit
import Then

//
class DetailPostTableViewCell: UICollectionViewCell {
 
    static let identifier = "DetailPostTableViewCell"
    

    // 세부 게시물에 대한 정보를 저장한 모델로 변경해야함 []
    private var postModel: [AllPostModel] = [AllPostModel]()
    
    private var postImageCollectionView : UICollectionView = {
        //컬렉션뷰 레이아웃 잡음
        var layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //셀당 사이즈 설정
        let widthSize = UIScreen.main.bounds.width
        let heightSize = UIScreen.main.bounds.height * 0.78
        layout.itemSize = CGSize(width: widthSize, height: heightSize)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DetailPostTableViewCell.self, forCellWithReuseIdentifier: DetailPostTableViewCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(postImageCollectionView)
        
        postImageCollectionView.delegate = self
        postImageCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        postImageCollectionView.frame = contentView.bounds
    }
        
    // 컬렉션뷰에 대한 셀의 이름을 배열로 추가 //모델도 바꿔야함 []
    public func configure(with model: [AllPostModel]) {
//        self.postImageCollectionView = model
        // 컨트롤러 선택 이후 titles 에 배열이 업데이트되어 다시 비동기로 데이터 업데이트함
        DispatchQueue.main.async { [weak self] in
            self?.postImageCollectionView.reloadData()
        }
    }
    
    
}

extension DetailPostTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailPostCollectionViewCell.identifier, for: indexPath) as? DetailPostCollectionViewCell else { return UICollectionViewCell() }
        
        // 새로 추가될 이미지 셀을 추가
//        guard let model = postModel[indexPath.row].imageURL else { return UICollectionViewCell() } //현재 model 은 옵셔널 스트링 값
//        cell.configure(with: model)

        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 // data의 indexPath 의 count
    }
    
    
}
