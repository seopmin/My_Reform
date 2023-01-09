//
//  SignUpViewController.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/06.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "마이리폼"
        label.textColor = .black
        label.font = .systemFont(ofSize: 40, weight: .ultraLight)
        return label
    }()
    
//    lazy var logo  = { () -> UIImageView
//        let logo: UIImage = UIImage(named: "myReform_logo")!
//
//        return logo
//    }()
//
    
    // 로고 이미지
    var logo: UIImageView {

        let width: CGFloat = self.view.bounds.width*2/3
        let height: CGFloat = self.view.bounds.height/14

        // Set x, y of UIImageView.
        let posX: CGFloat = (self.view.bounds.width - width)/2
        let posY: CGFloat = (self.view.bounds.height - height)*2/5

        // Create UIImageView.
        let imageView = UIImageView(frame: CGRect(x: posX, y: posY, width: width, height: height))
        let myImage: UIImage = UIImage(named: "myReform_logo")!

        imageView.image = myImage
        return imageView
    }
    
    
    // "SNS 계정으로 간편하게 시작하기" 레이블
    lazy var label = { () -> UILabel in
        let label = UILabel()
        label.text = "SNS 계정으로 간편하게 시작하기"
        return label
    }()

    lazy var apple_button = { () -> UIButton in
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "apple_image"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .white
        return button
    }()

    lazy var kakao_button = { () -> UIButton in
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "kakao_image"), for: .normal)
        button.tintColor = .white
        button.backgroundColor = .white
        return button
    }()


    
        
    
    
//    lazy var appleLoginButton: UIButton = {
//        let button = UIButton()
//        button.addTarget(self,
//                         action: #selector(appleLoginButtonTapped),
//                         for: .touchUpInside)
//        return button
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        self.view.addSubview(label)
        self.view.addSubview(self.logo)
        self.view.addSubview(apple_button)
        self.view.addSubview(kakao_button)
        
        label.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(kakao_button).offset(-100)
        }
        
        apple_button.snp.makeConstraints{ (make) in
            make.height.width.equalTo(70)
            make.centerX.equalToSuperview().offset(50)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-100)
        }
        
        kakao_button.snp.makeConstraints{ (make) in
            make.height.width.equalTo(70)
            make.centerX.equalToSuperview().offset(-50)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-100)
        }
        
    }
    


}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        SignUpViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName("Preview")
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
} #endif

