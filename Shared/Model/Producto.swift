//
//  Producto.swift
//  Shopping cart list (iOS)
//
//  Created by Frank Jansen on 9/9/22.
//

import Foundation

/// esta estructura va a crear el tipo de dato de los items
struct Producto: Decodable, Identifiable {
    let itemName : String
    let id = UUID()
    let itemPrice : Int
    var itemStock : Int
    
//    init(itemName: String, itemPrice: Int, itemStock: Int) {
//        self.itemName = itemName
//        self.itemPrice = itemPrice
//        self.itemStock = itemStock
//    }∫
        
    
}
