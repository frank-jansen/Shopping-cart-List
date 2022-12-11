//
//  StockViewModel.swift
//  Shopping cart list (iOS)
//
//  Created by Frank Jansen on 9/9/22.
//

import Foundation

class StockViewModel: ObservableObject  {
    @Published var stock : Stock?
    
    init() {
        // esperamos unos segundos para llamar a load. asi simulamos una carga de internet (?)
        //        Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { [weak self]  _ in
        //            self?.load()
        //        }
        //
        //        stock = Stock(itemName: "Pan", itemList: [
        //            Producto(itemName: "PAtRICK", itemPrice: 0, itemStock: 0),
        //            Producto(itemName: "THISISAVERLYLONGTESTTHATWILLCOVEREVERYTHING", itemPrice: 0, itemStock: 5),
        //            Producto(itemName: "Sandy", itemPrice: 0, itemStock: 10),
        //            Producto(itemName: "AKSNDAHNSDOASBDABJD", itemPrice: 0, itemStock: 15)
        //        ])
        load()
        
    }
    
    //en esta funcion debemos leer el archivo Json que tenemos en el proyecto y transformarlo en un stock
    // debemos usar el bundle para leer el archivo local y luego el json decoder
    // ademas el stock y sus productos deben ser decodable
    private func load() {
        do {
            let decoder = JSONDecoder()
            guard let url = Bundle.main.url(forResource: "stock_dummy", withExtension: "json")
                    
            else {
                stock = nil
                return
            }
            
            
            let data = try Data(contentsOf: url)
            stock = try decoder.decode(Stock.self, from: data)
        } catch {
            print(error)
            stock = nil
        }
    }
    
    func remove(producto: Producto) {
        guard let targetIndex = stock?.itemList.firstIndex(where: { $0.id == producto.id })
        else { return }
        if let itemStock = stock?.itemList[targetIndex].itemStock, itemStock > 1 {
            stock?.itemList[targetIndex].itemStock -= 1
        }
            else {
            stock?.itemList.remove(at: targetIndex)
        }
           
    }
    func add(producto: Producto) {
        guard let targetIndex = stock?.itemList.firstIndex(where: { $0.id == producto.id })
        else { return }
        stock?.itemList[targetIndex].itemStock += 1
    }
}
