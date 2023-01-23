//
// CompleteViewController.swift
// My Reform
//
// Created by 최성우 on 2023/01/16.
//
import UIKit
import SnapKit
import Then
class CompleteSignUpViewController: UIViewController {
    
    var nickname: String = ""
    
    lazy var welcomeLabel = { () ->UILabel in
        let label = UILabel()
        label.text = "환영해요,"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var nicknameLabel = { () ->UILabel in
        let label = UILabel()
        label.text = "닉네임 님"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var explainLabel = { () -> UILabel in
        let label = UILabel()
        label.text = "마이리폼에 가입이 완료되었어요."
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var explainLabel2 = { () -> UILabel in
        let label = UILabel()
        label.text = "다양한 리폼을 둘러보고 나만의 것도 소개해보세요!"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var goButton = { () -> UIButton in
        let goButton = UIButton()
        goButton.backgroundColor = UIColor.mainColor
        goButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        goButton.setTitle("둘러보러 가기", for: .normal)
        goButton.layer.cornerRadius = 8
        return goButton
    }()
    
    lazy var helloImage = { () -> UIImageView in
        let helloImage = UIImageView()
        helloImage.image = UIImage(named: "complete")
        return helloImage
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        
        setUIView()
        setUIConstraints()
        
        goButton.addTarget(self, action: #selector(moveLogin), for: .touchUpInside)
    }
    
    @objc private func moveLogin() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setUIView() {
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(nicknameLabel)
        self.view.addSubview(explainLabel)
        self.view.addSubview(explainLabel2)
        self.view.addSubview(goButton)
        self.view.addSubview(helloImage)
    }
    
    private func setUIConstraints() {
        
        welcomeLabel.snp.makeConstraints{
            (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(35)
            make.leading.equalTo(30)
        }
        
        nicknameLabel.snp.makeConstraints{
            (make) in
            make.top.equalTo(welcomeLabel.snp.top)
            make.leading.equalTo(welcomeLabel.snp.trailing).inset(-5)
        }
        
        explainLabel.snp.makeConstraints{
            (make) in
            make.top.equalTo(welcomeLabel.snp.bottom).inset(-20)
            make.leading.equalTo(30)
        }
        
        explainLabel2.snp.makeConstraints{
            (make) in
            make.top.equalTo(explainLabel.snp.bottom).inset(-15)
            make.leading.equalTo(30)
        }
        
        helloImage.snp.makeConstraints{
            (make) in
            make.width.equalTo(380)
            make.height.equalTo(420)
            make.top.equalTo(explainLabel2.snp.bottom).inset(-80)
            make.centerX.equalToSuperview()
        }
        
        goButton.snp.makeConstraints{
            (make) in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
}



#if DEBUG
import SwiftUI
struct CompleteViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController{
        CompleteSignUpViewController()
    }
}
@available(iOS 13.0, *)
struct CompleteViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            CompleteViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
} #endif
