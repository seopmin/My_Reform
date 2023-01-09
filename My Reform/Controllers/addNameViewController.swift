//
//  addNameViewController.swift
//  My Reform
//
//  Created by 곽민섭 on 2023/01/09.
//

import UIKit

class addNameViewController: UIViewController, UITextFieldDelegate {

    
    lazy var label_1 = { () -> UILabel in
        let label = UILabel()
        label.text = "가입을 축하드려요!"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    lazy var label_2 = { () -> UILabel in
        let label = UILabel()
        label.text = "사용하실 닉네임을 알려주세요."
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    lazy var label_3 = { () -> UILabel in
        let label = UILabel()
        label.text = "특수문자는 사용할 수 없어요."
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    lazy var input = { () -> UITextField in
        let text = UITextField()

        text.placeholder = "10글자 내로 입력해주세요."
        text.font = UIFont.systemFont(ofSize: 23)

        return text
        
    }()
    lazy var input_length = { () -> UILabel in
        let label = UILabel()
        
        label.text = "(0/10)"
        label.font = UIFont.systemFont(ofSize: 23)
        label.alpha = 0.3
        return label
    }()
    lazy var btn = { () -> UIButton in
        let btn = UIButton()
        btn.backgroundColor = .systemGray
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.setTitle("다음", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 8
        // 버튼 비활성화
        btn.isEnabled = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        input.delegate = self
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(label_1)
        self.view.addSubview(label_2)
        self.view.addSubview(label_3)
        self.view.addSubview(input)
        self.view.addSubview(btn)
        self.view.addSubview(input_length)
        
        label_1.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(30)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(70)
        }
        label_2.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(30)
            make.top.equalTo(label_1).offset(35)
        }
        label_3.snp.makeConstraints { (make) in
            make.leading.equalTo(self.view).offset(30)
            make.top.equalTo(label_2).offset(40)
        }
        input.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalTo(self.view).offset(30)
        }
        input.addTarget(self, action: #selector(textField), for: .editingChanged)
        input_length.snp.makeConstraints { (make) in
            make.centerY.equalTo(input)
            make.leading.equalTo(input.snp.trailing).offset(10)
        }
        btn.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
        }


        

        // Do any additional setup after loading the view.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        input_length.text = "(\(input.text!.count)/10)"
        
        return true
    }

}


#if DEBUG
import SwiftUI
struct addNameViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    @available(iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        addNameViewController()
    }
}
@available(iOS 13.0, *)
struct addNameViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        Group {
            addNameViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName("Preview")
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
        }
    }
} #endif
