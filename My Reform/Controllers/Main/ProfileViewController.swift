//
//  ProfileViewController.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/06.
//

import UIKit
import SnapKit
import Then

class ProfileViewController: UIViewController {

    static let identifier = "ProfileViewController"
    
    
    lazy var backButton = { () -> UIButton in
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "backButton"), for: .normal)
        return button
    } ()
    
    lazy var editButton = { () -> UIButton in
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "edit_icon"), for: .normal)
        return button
    } ()
    
    lazy var profileText = { () -> UILabel in
        let label = UILabel()
        label.text = "프로필"
        label.font = UIFont(name: "Avenir-Black", size: 18)
        return label
    } ()
    
    lazy var homeFeedTable = { () -> UITableView in
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        return table
    } ()
    
    lazy var backgroundImage = { () -> UIImageView in
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "backgroundImage")
        return backgroundImage
    } ()
    
    lazy var profileImage = { () -> UIImageView in
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "profile_icon")
        return profileImage
    } ()
    
    lazy var nameLabel = { () -> UILabel in
        let nameLabel = UILabel()
        nameLabel.text = "백살먹은 리포머"
        nameLabel.font = UIFont(name: "Avenir-Black", size: 18)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return nameLabel
    } ()
    
    lazy var introLabel = { () -> UILabel in
        let introLabel = UILabel()
        introLabel.text = "혼자 만드는 거 좋아하는 리포머입니다. @reformer_hundred"
        introLabel.font = UIFont(name: "Avenir-Black", size: 13)
        introLabel.numberOfLines = 2
        introLabel.textAlignment = .center
        introLabel.preferredMaxLayoutWidth = 240
        return introLabel
    } ()
    
    
    lazy var uploadLabel = { ()
        -> UILabel in
        let uploadLabel = UILabel()
        uploadLabel.text = "업로드한 리폼"
        uploadLabel.font = UIFont(name: "Avenir-Black", size: 20)
        uploadLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return uploadLabel
    } ()
    
    lazy var heartButton = { () -> UIButton in
        let heartButton = UIButton()
        heartButton.setImage(UIImage(systemName: "heart", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)), for: .normal)
        heartButton.tintColor = .systemGray
        return heartButton
    }()
    
    
    lazy var titleCellLabel = { () -> UILabel in
        let titleCellLabel = UILabel()
        titleCellLabel.text = "이름"
        titleCellLabel.font = UIFont(name: "Avenir-Black", size: 18)
        return titleCellLabel
    } ()
    
    lazy var titleCellImageView = { () -> UIImageView in
        let titleCellImageView = UIImageView()
        titleCellImageView.contentMode = .scaleAspectFill
        titleCellImageView.clipsToBounds = true
        titleCellImageView.layer.cornerRadius = 10
        return titleCellImageView
    } ()
    
    lazy var minuteCellLabel = { () -> UILabel in
        let minuteCellLabel = UILabel()
        minuteCellLabel.text = "10분 전"
        minuteCellLabel.font = UIFont(name: "Avenir-Black", size:10)
        return minuteCellLabel
    } ()
    
    lazy var priceCellLabel = { () -> UILabel in
        let priceCellLabel = UILabel()
        priceCellLabel.text = "30,000 원"
        priceCellLabel.font = UIFont(name: "Avenir-Black", size: 18)
        return priceCellLabel
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        
        self.view.insertSubview(backgroundImage, belowSubview: self.view)
        self.view.addSubview(backButton)
        self.view.addSubview(profileText)
        self.view.addSubview(editButton)
        self.view.addSubview(profileImage)
        self.view.addSubview(nameLabel)
        self.view.addSubview(introLabel)
        self.view.addSubview(uploadLabel)
    
        self.profileText.textColor = UIColor.white
        
        backButton.snp.makeConstraints{
            (make) in
            make.top.equalToSuperview().inset(50)
            make.leading.equalToSuperview().inset(15)
            make.width.equalTo(10.02)
            make.height.equalTo(18.04)
        }
        
        profileText.snp.makeConstraints{
            (make) in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()

        }
        
        editButton.snp.makeConstraints{
            (make) in
            make.top.equalToSuperview().inset(50)
            make.trailing.equalToSuperview().inset(15)
            make.width.equalTo(28)
            make.height.equalTo(16)
        }
        
        backgroundImage.snp.makeConstraints{
            (make) in
            make.top.equalToSuperview().inset(0)
            make.width.equalTo(476.32)
            make.height.equalTo(182.97)
        }
        
        profileImage.snp.makeConstraints{
            (make) in
            make.top.equalToSuperview().inset(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(117)
            make.height.equalTo(116)
        }
        
        nameLabel.snp.makeConstraints{
            (make) in
            make.top.equalTo(profileImage.snp.bottom).inset(-15)
            make.centerX.equalToSuperview()
        }
        
        introLabel.snp.makeConstraints{
            (make) in
            make.top.equalTo(nameLabel.snp.bottom).inset(-15)
            make.centerX.equalToSuperview()
        }
        
        uploadLabel.snp.makeConstraints{
            (make) in
            make.top.equalTo(introLabel.snp.bottom).inset(-30)
            make.leading.equalToSuperview().inset(10)
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
        homeFeedTable.frame.origin.x = 0
        homeFeedTable.frame.origin.y = 400
        homeFeedTable.contentOffset = CGPoint(x: 0, y: 0 - homeFeedTable.contentInset.top)
//        homeFeedTable.snp.makeConstraints{
//            (make) in
//            make.bottom.equalToSuperview().inset(0)
//        }
        
        
    }


}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as? MainTableViewCell else { return UITableViewCell()  }
        
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

#if DEBUG
import SwiftUI
struct ProfileViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    ProfileViewController()
    }
}
@available(iOS 13.0, *)
struct ProfileViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ProfileViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
