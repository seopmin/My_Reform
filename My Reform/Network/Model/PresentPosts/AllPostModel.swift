//
//  AllPostModel.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/19.
//

import Foundation


// 01.21 price와 imageURL 임의로 추가 - API명세서 확인 후 변경해야함 []

struct AllPostModel : Decodable {
    let status : Int
    let code : String
    let message : String
    let data : [AllPostData?]
}

struct AllPostData : Decodable {
    let Key : AllViewKey?
    let value : AllViewValue?
}

struct AllViewKey : Decodable{
    let boardId : Int?
    let user : AllViewUser?
    let categoryId : Int?
    let title : String?
    let contents : String?
    let createAt : String?
    let updateAt : String?
    let status : Int?
    let price : Int?
}


struct AllViewValue : Decodable {
    let boardImageId : Int?
    let boardId :Int?
    let image : AllViewImage?
    
    
}

struct AllViewUser : Decodable {
    let userId : Int?
    let email : String?
    let id : String?
    let nickname : String?
    let introduction : String?
}

struct AllViewImage : Decodable{
    let createAt : String?
    let updateAt : String?
    let status : Int?
    let imageId : Int?
    let imageURL : String?
}

