//
//  AllPostDataManager.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/19.
//

import Foundation
import Alamofire

class AllPostDataManager {
    
    static var Headers : HTTPHeaders = ["Content-Type" : "application/json"]
    
    func allPostGet(_ viewController: HomeViewController) {
        
        AF.request("",method: .get, parameters: nil, headers: AllPostDataManager.Headers)
            .validate().responseDecodable(of: AllPostModel.self) { response in
                switch(response.result) {
                case .success(let result) :
                    print("게시물 불러오기 성공 - \(result)")
                    // 마지막 빌드 - 오류나면 밑에 코드 [result]에 괄호를 빼고 homeViewCon에서 successAllPostModel(result 에 괄호 빼기)
                    viewController.successAllPostModel(result: [result])
                case .failure(let error) :
                    print(error.localizedDescription)
                    
                }
            }
    }
}
