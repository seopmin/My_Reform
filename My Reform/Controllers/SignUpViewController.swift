//
// SignUpViewController.swift
// My Reform
//
// Created by 곽민섭 on 2023/01/16.
//
import UIKit
import SnapKit
import Alamofire

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
    lazy var usable_name_label = { () -> UILabel in
        let label = UILabel()
        label.text = "사용할 수 있는 닉네임이에요"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .systemPurple
        return label
        
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
    lazy var usable_id_label = { () -> UILabel in
        let label = UILabel()
        label.text = "사용할 수 있는 아이디예요"
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .systemPurple
        return label
        
    }()    // --- 이메일 ----
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
        btn.backgroundColor = .systemPurple
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
        next_btn.addTarget(self, action: #selector(nextFunc), for: .touchDown)
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
        view.addSubview(usable_name_label)
        view.addSubview(usable_id_label)
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
        usable_name_label.snp.makeConstraints { make in
            make.top.equalTo(name_input.snp.bottom).offset(3)
            make.leading.equalTo(name_input.snp.leading)
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
        usable_id_label.snp.makeConstraints { make in
            make.top.equalTo(id_input.snp.bottom).offset(3)
            make.leading.equalTo(id_input.snp.leading)
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
        print(name_input.text!)
    }
    // 아이디 중복 버튼 눌릴 때
    @objc func IDButtonDidTap() {
        print(id_input.text!)
    }
    
    //다음 버튼 눌렀을 시
    @objc func nextFunc() {
        print("다음버튼 누름")
        print("패스워드 값 - \(password_input.text ?? "")")
        
        let userData = SignUpInput(id: id_input.text ?? "", email: email_input.text ?? "", nickname: name_input.text ?? "", pw: password_input.text ?? "", marketing: TermsViewController.termAllow)
        SignUpDataManager.posts(self, userData)
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

//MARK: - API
extension SignUpViewController{
    
    func checkSignUpResultCode(_ code: Int){
        switch(code){
        case 200:
            let alert = UIAlertController()
            alert.title = "회원가입을 축하합니다!"
            alert.message = "My Reform 서비스를 자유롭게 이용해보세요."
            let alertAction = UIAlertAction(title: "확인", style: .default) {_ in
                self.navigationController?.popToRootViewController(animated: true)
            }
            alert.addAction(alertAction)
            
            self.present(alert, animated: true, completion: nil)
            alert.modalPresentationStyle = .overFullScreen
            return
        case 400:
//            view.nextButton.isEnabled = false
//            view.idCanUseLabel.isHidden = false
//            view.idCanUseLabel.text = "중복된 아이디 입니다."
            return
        default:
            print("데이터베이스 오류")
            let alert = UIAlertController()
            alert.title = "서버 오류"
            alert.message = "서버에서 오류가 발생했습니다. 잠시 후 다시 시도해주세요."
            let alertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
    }
    
    func checkEmailApiResultCode(_ code: Int){
        
        switch code {
//        case 200:
//            view.idCanUseLabel.text = "*사용 가능한 이메일입니다."
//            view.idCanUseLabel.textColor = UIColor.mainColor
//            return
//
//        case 2017:
//            view.idCanUseLabel.isHidden = false
//            view.idCanUseLabel.text = "*중복된 이메일 입니다."
//            view.idCanUseLabel.textColor = .systemRed
//            isValidEmail = false
//
//            return
        default:
            print("데이터베이스 오류")
            let alert = UIAlertController()
            alert.title = "서버 오류"
            alert.message = "서버에서 오류가 발생했습니다. 잠시 후 다시 시도해주세요."
            let alertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
            return
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
