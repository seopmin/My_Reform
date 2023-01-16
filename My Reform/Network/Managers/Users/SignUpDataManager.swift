//
//  SignUpDataManager.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/16.
//

import Foundation
import Alamofire

class SignUpDataManager{
    
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

    // 서버에 값 전송
    func posts(_ viewController: SignUpViewController, _ parameter: SignUpInput){
        AF.request("https://211.176.69.65:8080/users/new-user", method: .post, parameters: parameter, encoder: JSONParameterEncoder.default, headers: nil).validate().responseDecodable(of: SingUpModel.self) { response in
            print(response)
            switch response.result {
            case .success(let result):
                print("로그인 성공")
                viewController.checkSignUpResultCode(result.code)
            case .failure(let error):
                print("로그인 실패")
                print(error.localizedDescription)
            }
        }
    }
}
