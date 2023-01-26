//
//  DetailPostViewModel.swift
//  My Reform
//
//  Created by 박현준 on 2023/01/26.
//

import Foundation

struct DetailPostViewModel {
    var imageUrl: [String]?
    var nickname : String
    var title: String
    var minute: String
    var price: Int
    var categoryId : String?
    var content : String
    var heart : Bool?
    var heartNum : Int?
}
