//
//  AllPostDataManager.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/19.
//

import Foundation
import Alamofire

class AllPostDataManager {
    
    
    func allPostGet(_ viewController: HomeViewController) {
        
        AF.request("\(Constants.baseURL)/boards?lastBoardId=5&size=10",method: .get, parameters: nil).validate(statusCode: 200..<500).responseDecodable(of: AllPostModel.self) { response in
                switch(response.result) {
                case .success(let result) :
                    print("게시물 불러오기 성공 - \(result)")
                    // 마지막 빌드 - 오류나면 밑에 코드 [result]에 괄호를 빼고 homeViewCon에서 successAllPostModel(result 에 괄호 빼기)
                    viewController.successAllPostModel(result: [result])
                case .failure(let error) :
                    print(error)
                    print(error.localizedDescription)
                    
                }
            }
    }
}
