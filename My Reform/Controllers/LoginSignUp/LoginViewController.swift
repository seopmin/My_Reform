//
//  SignUpViewController.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/06.
//

import UIKit
import SnapKit
import Then
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    /* // 카카오 네이티브 키 값 가져오는 코드
     let KAKAO_APP_KEY: String = Bundle.main.infoDictionary?["KAKAO_APP_KEY"] as? String ?? "KAKAO_APP_KEY is nil"
     KakaoSDKCommon.initSDK(appKey: KAKAO_APP_KEY, loggingEnable:true)
     */
   
    
    private let logoImage = UIImageView().then {
        let logo = UIImage(named: "myReform_logo")
        $0.image = logo
    }
    
    private let idLabel = UILabel().then {
        $0.text = "아이디"
        $0.textColor = UIColor.systemGray
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    private let idTextfield = UITextField().then {
        $0.placeholder = "아이디를 입력해주세요."
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        $0.layer.cornerRadius = 7
    }
    
    private let passwordLabel = UILabel().then {
        $0.text = "비밀번호"
        $0.textColor = UIColor.systemGray
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    private let passwordTextfield = UITextField().then {
        $0.placeholder = "비밀번호를 입력해주세요."
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.backgroundColor = UIColor.gray.withAlphaComponent(0.1)
        $0.layer.cornerRadius = 7
        $0.isSecureTextEntry = true
    }
    
    private let loginBtn = UIButton().then {
        $0.backgroundColor = UIColor.mainColor
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 10
    }
    
    private let noAccountAskLabel = UILabel().then {
        $0.text = "계정이 없으신가요?"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    
    private let moveSignUpBtn = UIButton().then {
        $0.setTitle("회원가입 하기", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        $0.setTitleColor(.orange, for: .normal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        setUIView()
        setUIConstraints()
        
        
        moveSignUpBtn.addTarget(self, action: #selector(moveSignup), for: .touchUpInside)
        loginBtn.addTarget(self, action: #selector(loginBtnDidTap), for: .touchUpInside)
        
        //로그인VC 접근시 기존 스택VC들 제거
        let endIndex = (self.navigationController?.viewControllers.endIndex)!
        self.navigationController?.viewControllers.removeSubrange(0..<endIndex - 1)
    }
    
    
    
    private func setUIView() {
        self.view.addSubview(logoImage)
        self.view.addSubview(idLabel)
        self.view.addSubview(idTextfield)
        self.view.addSubview(passwordLabel)
        self.view.addSubview(passwordTextfield)
        self.view.addSubview(loginBtn)
        self.view.addSubview(noAccountAskLabel)
        self.view.addSubview(moveSignUpBtn)
    }
    
    private func setUIConstraints() {
        
        logoImage.snp.makeConstraints{ (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(170)
            make.centerX.equalToSuperview()
        }
        
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).inset(-130)
            make.leading.equalToSuperview().inset(30)
        }
        
        idTextfield.snp.makeConstraints { make in
            make.top.equalTo(idLabel.snp.bottom).inset(-5)
            make.leading.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(idTextfield.snp.bottom).inset(-15)
            make.leading.equalToSuperview().inset(30)
        }
        
        passwordTextfield.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).inset(-5)
            make.leading.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
        }
        
        loginBtn.snp.makeConstraints { make in
            make.top.equalTo(passwordTextfield.snp.bottom).inset(-25)
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        noAccountAskLabel.snp.makeConstraints { make in
            make.top.equalTo(loginBtn.snp.bottom).inset(-10)
            make.leading.equalToSuperview().inset(80)
        }
        
        moveSignUpBtn.snp.makeConstraints { make in
            make.top.equalTo(loginBtn.snp.bottom).inset(-20)
            make.leading.equalTo(noAccountAskLabel.snp.trailing).inset(-20)
            make.centerY.equalTo(noAccountAskLabel.snp.centerY)
            
        }
        
    }
    
    @objc func moveSignup() {
        let vc = TermsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func loginBtnDidTap() {
        let userData = LoginInput(id: idTextfield.text ?? "", pw: passwordTextfield.text ?? "")
        LoginDataManager.posts(self, userData)
    }

}



// MARK: - 카카오 API
//extension LoginViewController {
//
//    // 카카오 로그인 버튼 addTarget에 kakaoLoginButtonClicked() 추가 - []
//    private func kakaoLoginButtonClicked() {
//
//        // 카카오톡 설치 여부 확인
//        if (UserApi.isKakaoTalkLoginAvailable()) {
//            // 카카오톡 로그인. api 호출 결과를 클로저로 전달.
//            loginWithApp()
//        } else {
//            // 만약, 카카오톡이 깔려있지 않을 경우에는 웹 브라우저로 카카오 로그인함.
//            loginWithWeb()
//            }
//        }
//
//    private func loginWithWeb() {
//        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("loginWithKakaoAccount() success.")
//
//                    //do something
//                    _ = oauthToken
//
//                    // 어세스토큰
//                    let accessToken = oauthToken?.accessToken
//                    print("어세스 토큰 정보입니다 !!!!!!!!!\(String(describing: accessToken))")
//
//                    //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
//                    self.setUserInfo()
//                    let vc = TermsViewController()
//                    vc.modalPresentationStyle = .fullScreen
//                    self.present(vc, animated: true)
//                }
//            }
//
//    }
//
//
//    private func loginWithApp() {
//        UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("loginWithKakaoTalk() success.")
//
//                    //do something
//                    _ = oauthToken
//
//                    // 어세스토큰
//                    let accessToken = oauthToken?.accessToken
//                    print("어세스 토큰 정보입니다 @@@@@@@@@@@@@@\(String(describing: accessToken))")
//
//                    //카카오 로그인을 통해 사용자 토큰을 발급 받은 후 사용자 관리 API 호출
//                    self.setUserInfo()
//                    let vc = TermsViewController()
//                    vc.modalPresentationStyle = .fullScreen
//                    self.present(vc, animated: true)
//                }
//            }
//    }
//
//    private func setUserInfo() {
//        UserApi.shared.me() {(user, error) in
//            if let error = error {
//                print(error)
//            }
//            else {
//                print("me() success.")
//                //do something
//                _ = user
//                }
//        }
//    }
//
//    private func setUserToken() {
//        // 사용자 액세스 토큰 정보 조회
//        UserApi.shared.accessTokenInfo {(accessTokenInfo, error) in
//            if let error = error {
//                print(error)
//            }
//            else {
//                print("accessTokenInfo() success.")
//
//                //do something
//                _ = accessTokenInfo
//                print("accessToken 정보 : \(accessTokenInfo!)")
//            }
//        }
//    }
//}


