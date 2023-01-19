//
//  AllPostModel.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/19.
//

import Foundation

struct AddAllPostModel : Decodable{
    var key : AddPostKey
    var value : AddPostValue?
}

struct AddPostKey : Decodable{
    var createAt : String
    var updateAt : String
    var postId : Int
    var user : AddPostUser
    var categoryId : Int
    var title : String
    var contents : String
    var price : Int
}


struct AddPostValue : Decodable {
    var post_image_id : Int?
    var postId :Int?
    var image : AddPostImage?
    
    
}

struct AddPostUser : Decodable {
    var user_id : String
    var email : String
    var id : String
    var pw : String
    var nickname : String
    var intrudution : String
    var marketing : Bool
}

struct AddPostImage : Decodable{
    var createAt : String?
    var updateAt : String?
    var imageId : Int?
    var imageURL : String?
}

