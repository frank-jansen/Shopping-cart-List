//
//  Stock.swift
//  Shopping cart list (iOS)
//
//  Created by Frank Jansen on 9/9/22.
//

import Foundation
/// con esta estruc se manejan los productos del stock
struct Stock : Decodable {
    var itemName : String
    var itemList : [Producto]
//    var itemsSummary : Int {
//        var auxItems: Int = 0
//        for item in itemList {
//            auxItems = item.itemPrice + auxItems
//        }
//         return auxItems
//    }
    
    enum CodingKeys: String, CodingKey {
        case itemName = "name"
        case itemList = "products"
    }
}
