//
//  ContentView.swift
//  EcommerceTemplate
//
//  Created by Jean-Marc Boullianne on 12/2/19.
//  Copyright © 2019 Jean-Marc Boullianne. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var product:Product = Product(uuid: "product123", image: Image("product01"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are sick! Best purchase I've made in a long time. Soooo slick!")])
    
    @State var items:[Product] = [Product(uuid: "product01", image: Image("product01"), title: "Curology Shower Pack (3 Bottle Kit)", price: 29.99, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Leo vel fringilla est ullamcorper eget. Faucibus scelerisque eleifend donec pretium vulputate sapien. Luctus accumsan tortor posuere ac ut consequat semper.", reviews: [Review(name: "John Smith", rating: 4.7, content: "Finally a great lens! so good! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product02", image: Image("product02"), title: "EF-2 24mm f/2.8 Standard Lens", price: 99.00, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Leo vel fringilla est ullamcorper eget. Faucibus scelerisque eleifend donec pretium vulputate sapien. Luctus accumsan tortor posuere ac ut consequat semper.", reviews: [Review(name: "John Smith", rating: 3.7, content: "This is a great deal!! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product03", image: Image("product03"), title: "Casio Signature Gold Classic Watch", price: 19.99, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Leo vel fringilla est ullamcorper eget. Faucibus scelerisque eleifend donec pretium vulputate sapien. Luctus accumsan tortor posuere ac ut consequat semper.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This is a great deal!! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product04", image: Image("product04"), title: "HiTech GPS Smart Watch", price: 499.95, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Leo vel fringilla est ullamcorper eget. Faucibus scelerisque eleifend donec pretium vulputate sapien. Luctus accumsan tortor posuere ac ut consequat semper.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This is a great deal!! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product05", image: Image("product05"), title: "Adidas Classic", price: 130.00, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Leo vel fringilla est ullamcorper eget. Faucibus scelerisque eleifend donec pretium vulputate sapien. Luctus accumsan tortor posuere ac ut consequat semper.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This is a great deal!! Best purchase I've made in a long time. Soooo slick!")]),Product(uuid: "product06", image: Image("product06"), title: "Adidas Limited Edition Hu", price: 130.00, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Leo vel fringilla est ullamcorper eget. Faucibus scelerisque eleifend donec pretium vulputate sapien. Luctus accumsan tortor posuere ac ut consequat semper.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This is a great deal!! Best purchase I've made in a long time. Soooo slick!")])]
    @State var cart:[Product] = []
    @State var favorites:[Product] = []
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().isOpaque = true
        
        items.append(contentsOf:[product, product, product])
        cart.append(contentsOf: [product, product, product])
    }
    
    var body: some View {
        TCTabBar(images: [
            Image(systemName: "house.fill"),
            Image(systemName: "cart.fill"),
            Image(systemName: "heart.fill"),
            Image(systemName: "gear")
        ], tabIndex: 0, contentTabs: [
            AnyView(ProductCatalog(products: $items, cart: $cart, favorites: $favorites)),
            AnyView(CartView(items: $cart)),
            AnyView(ProductCatalog(products: $favorites, cart: $cart, favorites: $favorites)),
            AnyView(SettingsView())
        ])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
