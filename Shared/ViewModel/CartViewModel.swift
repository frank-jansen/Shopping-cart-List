//
//  CartViewModel.swift
//  Shopping cart list
//
//  Created by Frank Jansen on 14/9/22.
//

import Foundation

class CartViewModel: ObservableObject {
    @Published var products = [Producto]()
    var totalPrice : Int {
        var auxItems: Int = 0
        for product in products {
            auxItems = auxItems + product.itemPrice*product.itemStock
        }
         return auxItems
    }
    var totalItemsCount: Int {
        var auxContador: Int = 0
        for product in products {
            auxContador = auxContador + product.itemStock
        }
        return auxContador
    }
    
    // para agregar un producto, primero hay que ver si el producto ya existe si:
    // Solo aumentar el stock
    // si no guardar el producto con stock 1
    func add(producto: Producto) {
        guard let targetIndex = products.firstIndex(where: { $0.id == producto.id })
        else {
            var newProduct = producto
            newProduct.itemStock = 1
            products.append(newProduct)
            return
        }
        products[targetIndex].itemStock += 1
    }
    
    func delete(producto: Producto) {
        guard let targetIndex = products.firstIndex(where: { $0.id == producto.id })
        else {
            
            return
        }
        
        if products[targetIndex].itemStock > 1 {
            products[targetIndex].itemStock -= 1
        }
        else {
            products.remove(at: targetIndex)
        }
    }
}
