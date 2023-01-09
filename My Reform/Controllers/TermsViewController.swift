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
    
    private let termBtn1 = UIButton().then{
        $0.tintColor = .systemGray
        $0.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
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
    
    private let termBtn2 = UIButton().then{
        $0.tintColor = .systemGray
        $0.setImage(UIImage(systemName: "chevron.forward"), for: .normal)
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
        $0.isEnabled = false
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
        addTargets()
        
        //체크버튼 4개 확인
        checkedFourButton()
        
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
        view.addSubview(termBtn1)
        view.addSubview(termBtn2)
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
        
        termBtn1.snp.makeConstraints { make in
            make.width.height.equalTo(25)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.centerY.equalTo(Label2.snp.centerY)
            
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
        
        termBtn2.snp.makeConstraints { make in
            make.width.height.equalTo(25)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            make.centerY.equalTo(Label3.snp.centerY)
            
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
    
    private func addTargets() {
        // 서비스 이용약관 자세히 보기
        termBtn1.addTarget(self, action: #selector(termBtn1Clicked), for: .touchUpInside)
        // 개인정보 처리방침 자세히 보기
        termBtn2.addTarget(self, action: #selector(termBtn2Clicked), for: .touchUpInside)
        // 약관 전체동의 클릭 시
        checkBoxAll.addTarget(self, action: #selector(checkBoxAllClicked), for: .touchUpInside)
        // 다음 버튼 클릭 시
        nextButton.addTarget(self, action: #selector(nextButtonClicked), for: .touchUpInside)
    }
    
    @objc private func checkBoxAllClicked() {
        
        
        if checkBoxAll.isChecked == true {
            checkBox1.isChecked = true
            checkBox2.isChecked = true
            checkBox3.isChecked = true
            checkBox4.isChecked = true
            nextButton.backgroundColor = UIColor.mainColor
            nextButton.isEnabled = true
        }
         else {
            checkBox1.isChecked = false
            checkBox2.isChecked = false
            checkBox3.isChecked = false
            checkBox4.isChecked = false
            nextButton.backgroundColor = .systemGray
            nextButton.isEnabled = false
        }
    }
    
    @objc private func termBtn1Clicked() {
        
    }
    
    @objc private func termBtn2Clicked() {
        
    }
    
    @objc private func nextButtonClicked() {
        let vc = addNameViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    // 체크 4개가 되었을 시 버튼 활성화
    private func checkedFourButton() {
        if (checkBox1.isChecked == true) && (checkBox2.isChecked == true) && (checkBox3.isChecked == true) && (checkBox4.isChecked == true) || (checkBoxAll.isChecked == true ){
            // [] 버튼 비활성화였다가 활성화로 바꾸는 코드 추가
            nextButton.isEnabled = true
            nextButton.backgroundColor = UIColor.mainColor
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = .systemGray
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
