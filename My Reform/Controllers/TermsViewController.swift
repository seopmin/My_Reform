//
//  TermsViewController.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/09.
//

import UIKit
import SnapKit
import Then

class TermsViewController: UIViewController {

    private let serviceLabel = UILabel().then {
        $0.text = "서비스 이용동의"
        $0.font = UIFont(name: "Avenir-Black", size: 30)
    }
    
    private let checkBoxAll = TermsCheckButton().then{
        $0.backgroundColor = UIColor.gray
        $0.layer.cornerRadius = 20
        $0.setTitle("✓", for: .normal)
    }
    
    private let TermAllLabel = UILabel().then {
        $0.text = "약관 전체동의"
        $0.font = UIFont(name: "Avenir-Black", size: 20)
    }
    
    private let checkBox1 = TermsCheckButton().then{
        $0.backgroundColor = UIColor.gray
        $0.layer.cornerRadius = 20
        $0.setTitle("✓", for: .normal)
    }
    
    private let Label1 = UILabel().then {
        $0.text = "만 14세 이상입니다."
        $0.font = UIFont(name: "Avenir-Black", size: 18)
    }
    
    private let checkBox2 = TermsCheckButton().then{
        $0.backgroundColor = UIColor.gray
        $0.layer.cornerRadius = 20
        $0.setTitle("✓", for: .normal)
    }
    
    private let Label2 = UILabel().then {
        $0.text = "(필수) 서비스 이용 약관"
        $0.font = UIFont(name: "Avenir-Black", size: 18)
    }
    
    private let checkBox3 = TermsCheckButton().then{
        $0.backgroundColor = UIColor.gray
        $0.layer.cornerRadius = 20
        $0.setTitle("✓", for: .normal)
    }
    
    private let Label3 = UILabel().then {
        $0.text = "(필수) 개인정보 처리방침"
        $0.font = UIFont(name: "Avenir-Black", size: 18)
    }
    
    private let checkBox4 = TermsCheckButton().then{
        $0.backgroundColor = UIColor.gray
        $0.layer.cornerRadius = 20
        $0.setTitle("✓", for: .normal)
    }
    
    private let Label4 = UILabel().then {
        $0.text = "(선택) 마케팅 정보 수신동의"
        $0.font = UIFont(name: "Avenir-Black", size: 18)
    }
    
    private let nextButton = UIButton().then{
        $0.backgroundColor = UIColor.gray
        $0.layer.cornerRadius = 8
        $0.setTitle("다음", for: .normal)
    }
    
    private let sectionLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground

        setUIView()
        setUIConstraints()
        
    }

    
    
    func setUIView() {
        view.addSubview(serviceLabel)
        view.addSubview(checkBoxAll)
        view.addSubview(TermAllLabel)
        view.addSubview(nextButton)
        view.addSubview(sectionLine)
        view.addSubview(Label1)
        view.addSubview(Label2)
        view.addSubview(Label3)
        view.addSubview(Label4)
        view.addSubview(checkBox1)
        view.addSubview(checkBox2)
        view.addSubview(checkBox3)
        view.addSubview(checkBox4)
    }
    
    func setUIConstraints() {
        serviceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(25)
            make.leading.equalToSuperview().inset(30)
        }
        
        checkBoxAll.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.top.equalTo(serviceLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(30)
        }
        
        TermAllLabel.snp.makeConstraints { make in
            make.leading.equalTo(checkBoxAll.snp.trailing).offset(20)
            make.top.equalTo(serviceLabel.snp.bottom).offset(30)
            make.centerY.equalTo(checkBoxAll.snp.centerY)
        }
        
        sectionLine.snp.makeConstraints { make in
            make.top.equalTo(TermAllLabel.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(1)
            
        }
        
        checkBox1.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.top.equalTo(sectionLine.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(30)
        }
        
        Label1.snp.makeConstraints { make in
            make.leading.equalTo(checkBox1.snp.trailing).offset(20)
            make.top.equalTo(sectionLine.snp.bottom).offset(30)
            make.centerY.equalTo(checkBox1.snp.centerY)
        }
        
        checkBox2.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.top.equalTo(checkBox1.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(30)
        }
        
        Label2.snp.makeConstraints { make in
            make.leading.equalTo(checkBox2.snp.trailing).offset(20)
            make.top.equalTo(Label1.snp.bottom).offset(30)
            make.centerY.equalTo(checkBox2.snp.centerY)
        }
        
        checkBox3.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.top.equalTo(checkBox2.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(30)
        }
        
        Label3.snp.makeConstraints { make in
            make.leading.equalTo(checkBox3.snp.trailing).offset(20)
            make.top.equalTo(Label2.snp.bottom).offset(30)
            make.centerY.equalTo(checkBox3.snp.centerY)
        }
        
        checkBox4.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.top.equalTo(checkBox3.snp.bottom).offset(30)
            make.leading.equalToSuperview().inset(30)
        }
        
        Label4.snp.makeConstraints { make in
            make.leading.equalTo(checkBox4.snp.trailing).offset(20)
            make.top.equalTo(Label3.snp.bottom).offset(30)
            make.centerY.equalTo(checkBox4.snp.centerY)
        }
        
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    

//
//    @objc func didTapCheckBox() {
//        checkBox.backgroundColor = UIColor.mainColor
//
//    }

}

