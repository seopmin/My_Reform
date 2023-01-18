//
//  SignUpDataManager.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/16.
//

import Foundation
import Alamofire

class SignUpDataManager {
    
    static var Headers : HTTPHeaders = ["Content-Type" : "application/json"]
    
//    // 아이디 중복검사
//    func getsID(_ viewController: SignUpViewController, id: String){
//        AF.request("", method: .get, parameters: ["id":id], encoding: URLEncoding.queryString).validate().responseDecodable(of: SingUpModel.self) { response in
//            print(response)
//            switch response.result {
//            case .success(let result):
//                viewController.checkIdApiResultCode(result.code)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
//
//    // 닉네임 중복검사
//    func getNickname(_ viewController: SignUpViewController, nickname: String){
//        AF.request("", method: .get, parameters: ["nickname":nickname], encoding: URLEncoding.queryString).validate().responseDecodable(of: SingUpModel.self) { response in
//            print(response)
//            switch response.result {
//            case .success(let result):
//                viewController.checkNickNameResultCode(result.code)
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    
    // 서버에 회원가입 값 전송
    static func posts(_ viewController: SignUpViewController, _ parameter: SignUpInput){
        AF.request("http://211.176.69.65:8080/users/new-user", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: Headers).validate(statusCode: 200..<500).responseDecodable(of: SignUpModel.self) { response in
            switch response.result {
            case .success(let result):
                print("회원가입 데이터 전송 성공")
                print(result)
                viewController.checkSignUpResultCode(result.status)
            case .failure(let error):
                print("회원가입 데이터 전송 실패")
                print(error.localizedDescription)
                print(response.error ?? "")
            }
        }
    }
    

}
