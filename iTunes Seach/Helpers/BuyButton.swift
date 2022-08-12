//
//  BuyButton.swift
//  iTunes Seach
//
//  Created by Mark Perryman on 8/11/22.
//

import SwiftUI

struct BuyButton: View {
    let urlString: String
    let price: Double?
    let currency: String
    
    var body: some View {
        if let url =  URL(string: urlString), let priceString = formatPrice() {
            Link(destination: url) {
                Text(priceString)
            }
            .buttonStyle(BuyButtonStyle())
        }
    }
    
    func formatPrice() -> String? {
        
        guard let price = price else { return nil }
        
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.currencyCode = currency
        
        let priceString = nf.string(from: NSNumber(value: price))
        return priceString
    }
}

struct BuyButton_Previews: PreviewProvider {
    static var previews: some View {
        
        let example = Song.example()
        
        BuyButton(urlString: example.previewURL,
                  price: example.trackPrice,
                  currency: example.currency)
    }
}

struct BuySongButton: View {
    let urlString: String
    let price: Double?
    let currency: String
    
    var body: some View {
        if let price = price {
            BuyButton(urlString: urlString, price: price, currency: currency)
        } else {
            Text("ALBUM ONLY")
                .font(.footnote)
                .foregroundColor(.gray)
        }
    }
}
