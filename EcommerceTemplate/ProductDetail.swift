//
//  ProductDetail.swift
//  EcommerceTemplate
//
//  Created by Jean-Marc Boullianne on 12/4/19.
//  Copyright © 2019 Jean-Marc Boullianne. All rights reserved.
//

import SwiftUI

struct ProductDetail: View {
    
    var product:Product
    @Binding var cart:[Product]
    @Binding var favorites:[Product]
    
    @State private var showShareSheet = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                product.image
                .resizable()
                .scaledToFill()
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(product.title)
                        .font(Font.system(size: 24, weight: .semibold, design: .rounded))
                    Text("$\(String(format: "%.2f", product.price))")
                        .font(Font.system(size: 19, weight: .semibold, design: .rounded))
                }
                
                HStack(alignment: .center, spacing: 0) {
                    Button(action: {
                        if self.favorites.contains(where: { (fav) -> Bool in
                            fav.uuid == self.product.uuid
                        }) {
                            self.favorites.removeAll { (fav) -> Bool in
                                fav.uuid == self.product.uuid
                            }
                        } else {
                            self.favorites.append(self.product)
                        }
                        
                        
                        
                    }) {
                        if self.favorites.contains(where: { (fav) -> Bool in
                            fav.uuid == product.uuid
                        }) {
                            Image(systemName: "heart.fill")
                            .foregroundColor(Color.red)
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        } else {
                            Image(systemName: "heart")
                            .foregroundColor(Color.black)
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                        }
                        
                    }
                    Spacer()
                    Button(action: {
                        self.showShareSheet = !self.showShareSheet
                    }) {
                        Image(systemName: "square.and.arrow.up")
                        .foregroundColor(Color.black)
                        .frame(width: 40, height: 40, alignment: .center)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    }
                    Spacer()
                    Spacer()
                    Button(action: {
                        if self.cart.contains(where: { (prod) -> Bool in
                            prod.uuid == self.product.uuid
                        }) {
                            self.cart.removeAll { (prod) -> Bool in
                                prod.uuid == self.product.uuid
                            }
                        } else {
                            self.cart.append(self.product)
                        }
                    }) {
                        if self.cart.contains(where: { (prod) -> Bool in
                            prod.uuid == self.product.uuid
                        }) {
                            HStack(alignment: .center, spacing: 20) {
                                Text("IN YOUR CART")
                                Image(systemName: "checkmark")
                            }
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color.gray)
                            .cornerRadius(10)
                        } else {
                            HStack(alignment: .center, spacing: 20) {
                                Text("ADD TO CART")
                                Image(systemName: "cart.fill")
                            }
                            .padding(.horizontal, 40)
                            .padding(.vertical, 10)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color(red: 111/255, green: 115/255, blue: 210/255))
                            .cornerRadius(10)
                        }
                        
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                
                Text(product.description)
                    .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                
                Divider()
                
                // Review Overview Block
                VStack {
                    Text("Reviews")
                        .font(Font.system(size: 19, weight: .semibold, design: .rounded))
                    Text("\(product.reviews.count) review\(product.reviews.count == 1 ? "" : "s")")
                        .font(Font.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.gray)
                }
                RatingBlock(rating: product.rating, primaryColor: Color.yellow, secondaryColor: Color.gray)
                Divider()
                
                // Individual Review Blocks
                VStack {
                    ForEach(self.product.reviews.indices) { i in
                        HStack{
                            Text("\(self.product.reviews[i].name)")
                                .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            Spacer()
                            RatingBlock(rating: self.product.reviews[i].rating, primaryColor: Color.yellow, secondaryColor: Color.gray)
                        }
                        Text("\(self.product.reviews[i].content)")
                    }
                }
            }
            .padding(.top, 16)
            .padding(.bottom, 70)
        }
        .sheet(isPresented: $showShareSheet) {
            ShareSheet(activityItems: ["\(self.product.title) - $\(String(format: "%.2f", self.product.price)) | \(self.product.description.prefix(100))..."])
        }
    }
}

struct ProductDetail_Previews: PreviewProvider {
    
    static var product:Product = Product(uuid: "product06", image: Image("product06"), title: "Adidas Limited Edition Hu", price: 130.00, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Leo vel fringilla est ullamcorper eget. Faucibus scelerisque eleifend donec pretium vulputate sapien. Luctus accumsan tortor posuere ac ut consequat semper.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")])
    @State static var cart:[Product] = [Product(uuid: "product06", image: Image("product06"), title: "Adidas Limited Edition Hu", price: 130.00, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Leo vel fringilla est ullamcorper eget. Faucibus scelerisque eleifend donec pretium vulputate sapien. Luctus accumsan tortor posuere ac ut consequat semper.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are so good! Best purchase I've made in a long time. Soooo slick!")])]
    
    @State static var favorites:[Product] = []
    
    static var previews: some View {
        ProductDetail(product: product, cart: $cart, favorites: $favorites)
    }
}
