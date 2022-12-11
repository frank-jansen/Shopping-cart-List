//
//  MainPage.swift
//  Shared
//
//  Created by Frank Jansen on 9/9/22.
//

import SwiftUI

struct MainPage: View {
    @StateObject var stockViewModel = StockViewModel()
    @StateObject var cartViewModel = CartViewModel()
    @State private var showCart = false
    let espacer: CGFloat = 5
    
    var body: some View {
        ZStack {
            NavigationView {
                
                if let itemList = stockViewModel.stock?.itemList {
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible(minimum: 120), spacing: espacer),
                            GridItem(.flexible(minimum: 120), spacing: espacer),
                            GridItem(.flexible(minimum: 120))
                        ], spacing: espacer, content: {
                            ForEach(itemList) { product in
                                ProductButton(product: product)
                                    .contextMenu {
                                        Button {
                                            cartViewModel.add(producto: product)
                                            stockViewModel.remove(producto: product)
                                            
                                        } label: {
                                            Label(
                                                title: { Text("Agregar") },
                                                icon: { Image(systemName: "creditcard.circle") }
                                            )
                                        }
                                    }
                            }
                        }
                        )
                    }
                    .padding()
                    .navigationTitle("elija sus Productos")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        Button {
                            showCart.toggle()
                        } label: {
                            Image(systemName: "cart")
                            Text("x\(cartViewModel.totalItemsCount)")
                        }
                    }
                    .sheet(isPresented: $showCart) {
                        CartView()
                            .environmentObject(cartViewModel)
                            .environmentObject(stockViewModel)
                        
                    }
                    
                } else {
                    ProgressView("Loading...")
                }
            }
            .navigationViewStyle(.stack)
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
