//
//  ViewController.swift
//  test
//
//  Created by 최성우 on 2023/01/26.
//

import UIKit
import SnapKit
import Then

class SplashViewController: UIViewController {

    
    
    lazy var splashTitle = { () -> UIImageView in
        let splashTitle = UIImageView()
        splashTitle.image = UIImage(named: "logo2")
        return splashTitle
    }()
    
    
    lazy var splashTitle2 = { () -> UIImageView in
        let splashTitle2 = UIImageView()
        splashTitle2.image = UIImage(named: "logo1")
        return splashTitle2
    }()
    
    lazy var splashTitle3 = { () -> UIImageView in
        let splashTitle3 = UIImageView()
        splashTitle3.image = UIImage(named: "logo3")
        return splashTitle3
    }()
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        self.view.addSubview(splashTitle)
        self.view.addSubview(splashTitle2)
        self.view.addSubview(splashTitle3)
        
        splashTitle.snp.makeConstraints{
            (make) in
            make.leading.equalTo(splashTitle2.snp.leading).inset(323.24)
            make.centerY.equalToSuperview()
            make.width.equalTo(42.56)
            make.height.equalTo(89.79)
        }
        
        splashTitle2.snp.makeConstraints{
            (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(splashTitle3.snp.leading).inset(0)
            make.width.equalTo(105.08)
            make.height.equalTo(113)
        }
        
        splashTitle3.snp.makeConstraints{
            (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(152.99)
            make.height.equalTo(112.45)
        }
        
        self.splashTitle.alpha=1
        self.splashTitle2.alpha=1
        self.splashTitle3.alpha=0
        
        UIView.animate(withDuration: 1.0, delay: 1.5, options: .curveEaseIn, animations: {
            //애니메이션처리
            var splashTitleTopFrame = self.splashTitle.frame
            
            splashTitleTopFrame.origin.x -= splashTitleTopFrame.size.width*5
            
            self.splashTitle.frame = splashTitleTopFrame
            
        })
        
        UIView.animate(withDuration: 1.0, delay: 2.5, options: .curveEaseIn, animations: {
            self.splashTitle.alpha = 0
            self.splashTitle2.alpha = 0
            self.splashTitle3.alpha = 1
            
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        

    }


}

#if DEBUG
import SwiftUI
struct SplashViewControllerRepresentable: UIViewControllerRepresentable {
    
func updateUIViewController(_ uiView: UIViewController,context: Context) {
        // leave this empty
}
@available(iOS 13.0.0, *)
func makeUIViewController(context: Context) -> UIViewController{
    SplashViewController()
    }
}
@available(iOS 13.0, *)
struct SplashViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            SplashViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName(/*@START_MENU_TOKEN@*/"Preview"/*@END_MENU_TOKEN@*/)
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
        
    }
} #endif
