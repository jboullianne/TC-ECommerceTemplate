//
//  ProductCatalog.swift
//  EcommerceTemplate
//
//  Created by Jean-Marc Boullianne on 12/4/19.
//  Copyright © 2019 Jean-Marc Boullianne. All rights reserved.
//

import SwiftUI

struct ProductCatalog: View {
    
    @Binding var products:[Product]
    @Binding var cart:[Product]
    @Binding var favorites:[Product]
    
    var body: some View {
        
        var prods: [[Product]] = []
        _ = (products).publisher
            .collect(products.count % 2 == 1 ? (products.count / 2) + 1 : (products.count / 2))
            .collect()
            .sink(receiveValue: { prods = $0 })
        
        
        
        return NavigationView {
            ScrollView(.vertical, showsIndicators: true) {
                HStack(alignment: .top, spacing: 10) {
                    if prods.count > 0 {
                        VStack(alignment: .center, spacing: 8) {
                            ForEach(prods[0], id: \.uuid) { prod in
                                NavigationLink(destination:
                                    ProductDetail(product: prod, cart: self.$cart, favorites: self.$favorites)
                                        .padding(.horizontal, 16)
                                        
                                ) {
                                    ProductCell(product: prod)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    
                    if prods.count == 2 {
                        VStack(alignment: .center, spacing: 8) {
                            ForEach(prods[1], id: \.uuid) { prod in
                                NavigationLink(destination:
                                    ProductDetail(product: prod, cart: self.$cart, favorites: self.$favorites)
                                        .padding(.horizontal, 16)
                                ) {
                                    ProductCell(product: prod)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    
                    if prods.count == 0 {

                        VStack(alignment: .center, spacing: 4) {
                            Spacer()
                            Image(systemName: "bag.fill")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.gray)
                                .frame(width: 40, height: 40, alignment: .center)
                                .padding(.bottom, 20)
                                //.font(Font.system(size: 16, weight: .bold, design: .rounded))
                            Text("No Products To Display")
                                .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                        .padding(.bottom, 10)
                        
                    }
                    
                }
                .padding()
            }
            .padding(.bottom, 50)
            .navigationBarTitle("Catalog", displayMode: .inline)
            .navigationBarHidden(true)
        }
        
        
        
    }
}

struct ProductCatalog_Previews: PreviewProvider {
    
    @State static var items:[Product] = [Product(uuid: "product123", image: Image("product01"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product123", image: Image("product02"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product123", image: Image("product03"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product123", image: Image("product04"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product123", image: Image("product05"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product123", image: Image("product06"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")])]
    
    @State static var cart:[Product] = [Product(uuid: "product123", image: Image("product01"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product123", image: Image("product02"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product123", image: Image("product03"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product123", image: Image("product04"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product123", image: Image("product05"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product123", image: Image("product06"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")])]
    
    @State static var favorites:[Product] = []
    
    static var previews: some View {
        ProductCatalog(products: $items, cart: $cart, favorites: $favorites)
    }
}
