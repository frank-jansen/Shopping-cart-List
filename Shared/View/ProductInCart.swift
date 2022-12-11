//
//  CartListView.swift
//  Shopping cart list
//
//  Created by Frank Jansen on 15/9/22.
//

import SwiftUI

struct ProductInCart: View {
    let product: Producto
    @EnvironmentObject var cartViewModel : CartViewModel
    @EnvironmentObject var stockViewModel : StockViewModel
    var body: some View {
        HStack{
            Text(product.itemName)
            Spacer()
            Text("x\(product.itemStock)")
            Button {
                cartViewModel.delete(producto: product)
                stockViewModel.add(producto: product)
            } label: {
                Image(systemName: "minus").foregroundColor(.red)
            }
        }.padding()
    }
}

struct CartListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductInCart(product: Producto(itemName: "MANZANA ROJA", itemPrice: 500, itemStock: 500))
            
    }
}
