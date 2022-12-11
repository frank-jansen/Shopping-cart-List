//
//  CartView.swift
//  Shopping cart list
//
//  Created by Frank Jansen on 14/9/22.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color.yellow, Color.green],
    startPoint: .top, endPoint: .bottom)
struct CartView: View {
    @EnvironmentObject var carrito: CartViewModel
    @EnvironmentObject var stock: StockViewModel
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        ZStack {
            VStack{
                HStack() {
                    Text("Total Products: \(carrito.totalItemsCount)")
                        .background(.blue)
                        .padding()
                    Spacer()
                    
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "x.circle").foregroundColor(.black)
                    }.padding()
                    
                }
                List {
                    ForEach(carrito.products) { product in
                        ProductInCart(product: product)
                    }
                }
                HStack {
                    Text("Total a Pagar: \(carrito.totalPrice)")
                        .padding()
                    Spacer()
                }.background(.gray)
                HStack {
                    Button {
                        
                    } label: {
                        Label(
                            title: { Text("Finish And Pay") },
                            icon: { Image(systemName: "cart.fill") }
                        )
                    }
                }
            }
        }.background(.gray)
    }
    
}
struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartViewModel())
            .environmentObject(StockViewModel())
    }
}
