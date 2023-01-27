//
//  DetailPostCollectionViewCell.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/23.
//

import UIKit
import Alamofire
import SDWebImage

// TableView -> Vertical CollectionView -> Image Cell
class DetailPostCollectionViewCell: UICollectionViewCell {

    // 0123 데이터 api 변경후에 저장되는 모델들을 가져와야함
    var allPostModel : AllPostModel!
    
    static let identifier = "DetailPostCollectionViewCell"
    
    private let postImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 셀이보여지면 이 함수가 호출됨
    public func configure(with model: String) {
        // url 주소 변경해야함 []
        guard let url = URL(string: "\(Constants.baseURL)\(model)") else { return }
        postImageView.sd_setImage(with: url, completed: nil)
//        print(url)
    }
    
}
