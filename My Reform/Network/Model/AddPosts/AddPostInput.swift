//
//  AddPostInput.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/19.
//

import Foundation

struct AddPostInput : Encodable {
    //[] 추가필요
    var board : Board
}



struct Board : Encodable {
    var categoryId : Int
    var title : String
    var contents : String
}
