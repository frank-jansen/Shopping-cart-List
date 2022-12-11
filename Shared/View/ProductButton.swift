//
//  ProductButton.swift
//  Shopping cart list (iOS)
//
//  Created by Frank Jansen on 9/9/22.
//

import SwiftUI

struct ProductButton: View {
    let product: Producto
     
    var body: some View {
        ZStack(alignment: .center){
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.gray)
            
            VStack(alignment: .center) {
                
                Text(product.itemName)
                    .font(.title)
                    .foregroundColor(Color.black)
                Text("\(product.itemPrice)")
                    .font(.title2)
                    .foregroundColor(Color.black)
                Text("\(product.itemStock)")
                    .font(.subheadline)
                    .foregroundColor(Color.black)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct ProductButton_Previews: PreviewProvider {
    static var previews: some View {
        ProductButton(product: Producto(itemName: "MANZANA ROJA", itemPrice: 500, itemStock: 500))
    }
}
