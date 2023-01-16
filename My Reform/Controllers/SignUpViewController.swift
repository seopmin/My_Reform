//
// SignUpViewController.swift
// My Reform
//
// Created by 곽민섭 on 2023/01/16.
//
import UIKit
import SnapKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
  lazy var name_label = { () -> UILabel in
    let label = UILabel()
    label.text = "닉네임"
    label.font = UIFont.boldSystemFont(ofSize: 25)
    return label
  }()
  lazy var name_label_2 = { () -> UILabel in
    let label = UILabel()
    label.text = "10자 이내의 한글, 영문"
    label.font = UIFont.boldSystemFont(ofSize: 15)
    return label
  }()
  lazy var name_input = { () -> UITextField in
    let text = UITextField()
    text.placeholder = " 닉네임을 입력해주세요"
    text.font = UIFont.systemFont(ofSize: 20)
    text.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
    text.layer.cornerRadius = 10.0
    return text
  }()
  lazy var name_length = { () -> UILabel in
    let label = UILabel()
    label.text = "0/10"
    label.font = UIFont.systemFont(ofSize: 15)
    label.alpha = 0.3
    return label
  }()
  lazy var name_check_btn = { () -> UIButton in
    let btn = UIButton()
    btn.backgroundColor = .systemPurple
    btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    btn.setTitle("중복확인", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.layer.cornerRadius = 8
    btn.isEnabled = false
    return btn
  }()
  // ------------------
  lazy var id_label = { () -> UILabel in
    let label = UILabel()
    label.text = "아이디"
    label.font = UIFont.boldSystemFont(ofSize: 25)
    return label
  }()
  lazy var id_label_2 = { () -> UILabel in
    let label = UILabel()
    label.text = "6~12자의 영문, 숫자"
    label.font = UIFont.boldSystemFont(ofSize: 15)
    return label
  }()
  lazy var id_input = { () -> UITextField in
    let text = UITextField()
    text.placeholder = " 아이디를 입력해주세요"
    text.font = UIFont.systemFont(ofSize: 20)
    text.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
    text.layer.cornerRadius = 10.0
    return text
  }()
  lazy var id_length = { () -> UILabel in
    let label = UILabel()
    label.text = "0/12"
    label.font = UIFont.systemFont(ofSize: 15)
    label.alpha = 0.3
    return label
  }()
  lazy var id_check_btn = { () -> UIButton in
    let btn = UIButton()
    btn.backgroundColor = .systemPurple
    btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    btn.setTitle("중복확인", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.layer.cornerRadius = 8
    btn.isEnabled = false
    return btn
  }()
  // --- 이메일 ----
  lazy var email_label = { () -> UILabel in
    let label = UILabel()
    label.text = "이메일"
    label.font = UIFont.boldSystemFont(ofSize: 25)
    return label
  }()
  lazy var email_label_2 = { () -> UILabel in
    let label = UILabel()
    label.text = "예시) identity@website.com"
    label.font = UIFont.boldSystemFont(ofSize: 15)
    return label
  }()
  lazy var email_input = { () -> UITextField in
    let text = UITextField()
    text.placeholder = " 이메일을 입력해주세요"
    text.font = UIFont.systemFont(ofSize: 20)
    text.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
    text.layer.cornerRadius = 10.0
    return text
  }()
  // --- 비밀번호 -----
  lazy var password_label = { () -> UILabel in
    let label = UILabel()
    label.text = "비밀번호"
    label.font = UIFont.boldSystemFont(ofSize: 25)
    return label
  }()
  lazy var password_label_2 = { () -> UILabel in
    let label = UILabel()
    label.text = "8자 이상 영문, 숫자, 기호"
    label.font = UIFont.boldSystemFont(ofSize: 15)
    return label
  }()
  lazy var password_input = { () -> UITextField in
    let text = UITextField()
    text.placeholder = " 비밀번호를 입력해주세요"
    text.font = UIFont.systemFont(ofSize: 20)
    text.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
    text.layer.cornerRadius = 10.0
    text.isSecureTextEntry = true
    return text
  }()
  lazy var next_btn = { () -> UIButton in
    let btn = UIButton()
    btn.backgroundColor = .systemGray
    btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    btn.setTitle("다음", for: .normal)
    btn.setTitleColor(.white, for: .normal)
    btn.layer.cornerRadius = 8
    // 버튼 비활성화
//    btn.isEnabled = false
    return btn
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    name_input.delegate = self
    id_input.delegate = self
    self.view.backgroundColor = .systemBackground
    setUIView()
    setUIConstraints()
    name_input.addTarget(self, action: #selector(textField), for: .editingChanged)
    id_input.addTarget(self, action: #selector(textField2), for: .editingChanged)
    NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)),name: UITextField.textDidChangeNotification, object: name_input)
  }
  func setUIView() {
    view.addSubview(name_label)
    view.addSubview(name_label_2)
    view.addSubview(name_input)
    view.addSubview(name_length)
    view.addSubview(name_check_btn)
    view.addSubview(id_label)
    view.addSubview(id_label_2)
    view.addSubview(id_input)
    view.addSubview(id_length)
    view.addSubview(id_check_btn)
    view.addSubview(email_label)
    view.addSubview(email_label_2)
    view.addSubview(email_input)
    view.addSubview(password_label)
    view.addSubview(password_label_2)
    view.addSubview(password_input)
    view.addSubview(next_btn)
  }
  func setUIConstraints() {
    name_label.snp.makeConstraints { make in
      make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(25)
      make.leading.equalToSuperview().inset(30)
    }
    name_label_2.snp.makeConstraints { make in
      make.bottom.equalTo(name_label)
      make.leading.equalTo(name_label.snp.trailing).offset(10
      )
    }
    name_input.snp.makeConstraints { make in
      make.top.equalTo(name_label.snp.bottom).offset(10)
      make.leading.equalToSuperview().inset(20)
      make.width.equalTo(250)
      make.height.equalTo(50)
    }
    name_length.snp.makeConstraints { make in
      make.trailing.equalTo(name_input.snp.trailing).inset(5)
      make.centerY.equalTo(name_input)
    }
    name_check_btn.snp.makeConstraints { make in
      make.width.equalTo(100)
      make.height.equalTo(40)
      make.leading.equalTo(name_input.snp.trailing).offset(5)
      make.centerY.equalTo(name_input)
    }
    //------------
    id_label.snp.makeConstraints { make in
      make.top.equalTo(name_input.snp.bottom).offset(20)
      make.centerX.equalTo(name_label)
    }
    id_label_2.snp.makeConstraints { make in
      make.bottom.equalTo(id_label.snp.bottom)
      make.leading.equalTo(id_label.snp.trailing).offset(10)
    }
    id_input.snp.makeConstraints { make in
      make.top.equalTo(id_label.snp.bottom).offset(10)
      make.leading.equalToSuperview().inset(20)
      make.width.equalTo(250)
      make.height.equalTo(50)
    }
    id_length.snp.makeConstraints { make in
      make.trailing.equalTo(id_input.snp.trailing).inset(5)
      make.centerY.equalTo(id_input)
    }
    id_check_btn.snp.makeConstraints { make in
      make.width.equalTo(100)
      make.height.equalTo(40)
      make.leading.equalTo(id_input.snp.trailing).offset(5)
      make.centerY.equalTo(id_input)
    }
    //-------
    email_label.snp.makeConstraints { make in
      make.top.equalTo(id_input.snp.bottom).offset(20)
      make.centerX.equalTo(id_label)
    }
    email_label_2.snp.makeConstraints { make in
      make.bottom.equalTo(email_label.snp.bottom)
      make.leading.equalTo(email_label.snp.trailing).offset(10)
    }
    email_input.snp.makeConstraints { make in
      make.top.equalTo(email_label.snp.bottom).offset(10)
      make.leading.equalToSuperview().inset(20)
      make.width.equalTo(300)
      make.height.equalTo(50)
    }
    //-----
    password_label.snp.makeConstraints { make in
      make.top.equalTo(email_input.snp.bottom).offset(20)
      make.centerX.equalTo(email_label)
    }
    password_label_2.snp.makeConstraints { make in
      make.bottom.equalTo(password_label.snp.bottom)
      make.leading.equalTo(password_label.snp.trailing).offset(10)
    }
    password_input.snp.makeConstraints { make in
      make.top.equalTo(password_label.snp.bottom).offset(10)
      make.leading.equalToSuperview().inset(20)
      make.width.equalTo(300)
      make.height.equalTo(50)
    }
    //-----
    next_btn.snp.makeConstraints { make in
        make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(20)
        make.leading.trailing.equalToSuperview().inset(20)
        make.centerX.equalToSuperview()
        make.height.equalTo(50)    }
  }
    
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if (name_input.text!.count > 2 && name_input.text!.count <= 10) {
      name_check_btn.backgroundColor = .purple
      name_check_btn.isEnabled = true
      name_check_btn.addTarget(self, action: #selector(NextButtonDidTap), for: .touchUpInside)
    } else {
      name_check_btn.backgroundColor = .systemGray
      name_check_btn.isEnabled = false
    }
    if (name_input.text!.count > 10) {
      return false
    } else if (name_input.text!.count == 10) {
      name_length.textColor = .red
      name_length.font = UIFont.boldSystemFont(ofSize: 22)
      name_length.alpha = 0.6
    }else {
      name_length.textColor = .black
      name_length.font = UIFont.systemFont(ofSize: 23)
      name_length.alpha = 0.3
    }
    name_length.text = "\(name_input.text!.count)/10"
    return true
  }
    
  @objc func textField2(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if (id_input.text!.count > 5 && id_input.text!.count <= 12) {
      id_check_btn.backgroundColor = .purple
      id_check_btn.isEnabled = true
      id_check_btn.addTarget(self, action: #selector(IDButtonDidTap), for: .touchUpInside)
    } else {
      id_check_btn.backgroundColor = .purple
      id_check_btn.isEnabled = false
    }
    if (id_input.text!.count > 12) {
      return false
    } else if (id_input.text!.count == 12) {
      id_length.textColor = .red
      id_length.font = UIFont.boldSystemFont(ofSize: 22)
      id_length.alpha = 0.6
    }else {
      id_length.textColor = .black
      id_length.font = UIFont.systemFont(ofSize: 23)
      id_length.alpha = 0.3
    }
    id_length.text = "\(id_input.text!.count)/10"
    return true
  }
    
  // 닉네임 버튼 눌릴 때 다음 행위 함수
  @objc func NextButtonDidTap() {
    print(name_input)
  }
  // 아이디 중복 버튼 눌릴 때
  @objc func IDButtonDidTap() {
    print(id_input)
  }
    
  @objc private func textDidChange(_ notification: Notification) {
      if let textField = notification.object as? UITextField {
        if let text = textField.text {
          if text.count > 10 {
            // 10글자 넘어가면 자동으로 키보드 내려감
            textField.resignFirstResponder()
          }
          // 초과되는 텍스트 제거
          if text.count > 10 {
            let index = text.index(text.startIndex, offsetBy: 10)
            let newString = text[text.startIndex..<index]
            textField.text = String(newString)
          }
        }
      }
    }
}




#if DEBUG
import SwiftUI
struct SignUpViewControllerRepresentable: UIViewControllerRepresentable {
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
  }
  @available(iOS 13.0.0, *)
  func makeUIViewController(context: Context) -> some UIViewController {
    SignUpViewController()
  }
}
@available(iOS 13.0, *)
struct SignUpViewControllerRepresentable_PreviewProvider: PreviewProvider {
  static var previews: some View {
    Group {
      SignUpViewControllerRepresentable()
        .ignoresSafeArea()
        .previewDisplayName("Preview")
        .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
    }
  }
} #endif
