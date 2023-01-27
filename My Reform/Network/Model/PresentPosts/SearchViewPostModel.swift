//
//  SearchViewPostModel.swift
//  My Reform
//
//  Created by 곽민섭 on 2023/01/26.
//

import Foundation

struct SearchViewPostModel : Decodable {
    let status : Int
    let code : String
    let message : String
    let data : [SearchViewPostData]?
}


struct SearchViewPostData : Decodable {
    let boardId : Int?
    let categoryId : [Int]?
    let title : String?
    let contents : String?
    let updateAt : String?
    let price : Int?
    let nickname : String?
    let imageUrl : [String]?
}
