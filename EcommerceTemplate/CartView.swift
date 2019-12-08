//
//  CartView.swift
//  EcommerceTemplate
//
//  Created by Jean-Marc Boullianne on 12/2/19.
//  Copyright © 2019 Jean-Marc Boullianne. All rights reserved.
//

import SwiftUI

struct CartView: View {
    
    @Binding var items:[Product]
    
    @State private var isEditing:Bool = false
    
    var cartTotal:Double {
        get {
            items.reduce(0) { (res, prod) -> Double in
                res + prod.price
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            ZStack {

                // Header - "Your Cart"
                VStack(alignment: .center, spacing: 4) {
                    Text("Your Cart")
                        .font(Font.system(size: 16, weight: .bold, design: .rounded))
                    Text("\(items.count) Item\(items.count == 1 ? "" : "s")")
                        .font(Font.system(size: 13, weight: .semibold, design: .rounded))
                        .foregroundColor(Color.gray)
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.isEditing = !self.isEditing
                        }
                        
                    }) {
                        if self.isEditing {
                            Text("Done")
                            .font(Font.system(size: 16, weight: .bold, design: .rounded))
                            .padding(.trailing, 20)
                        } else {
                            Image(systemName: "ellipsis")
                            .padding(.trailing, 20)
                        }
                        
                    }.foregroundColor(Color(red: 111/255, green: 115/255, blue: 210/255))
                }
                
                
            }
            .padding(.bottom, 10)
            
            ScrollView(.vertical, showsIndicators: true) {
                // Items in Cart
                
                ForEach(items, id: \.uuid) { item in
                    HStack {
                        ProductCartRow(item: item)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                        
                        if self.isEditing {
                            Button(action: {
                                self.items.removeAll { (prod) -> Bool in
                                    prod.uuid == item.uuid
                                }
                            }) {
                                Image(systemName: "trash.fill")
                                .padding(.trailing, 20)
                            }.foregroundColor(Color.red)
                        }
                    }
                }

                // Shipping and Total Row
                HStack(alignment: .center, spacing: 12) {
                    
                    // Shipping Rect
                    VStack(alignment: .center, spacing: 4) {
                        Image("Shipping_Icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20, alignment: .center)
                        Text("FREE")
                            .font(Font.system(size: 14, weight: .semibold, design: .rounded))
                    }
                    .frame(width: 60, height: 60, alignment: .center)
                    .background(Color(red: 124/255, green: 234/255, blue: 156/255))
                    .cornerRadius(10)
                    
                    // Total Text
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Total:")
                            .foregroundColor(Color.gray)
                            .font(Font.system(size: 14, weight: .semibold, design: .default))
                        Text("$\(String(format: "%.2f", cartTotal))")
                            .font(Font.system(size: 20, weight: .heavy, design: .rounded))
                    }
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                
                // Checkout Button
                GeometryReader { geometry in
                    Button(action: {
                        
                    }) {
                        if self.items.count == 0 {
                            HStack(alignment: .center, spacing: 12) {
                                Text("Cart Empty")
                                Image(systemName: "xmark")
                            }
                            .frame(width: geometry.size.width - 40, height: 60, alignment: .center)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color.gray)
                            .cornerRadius(10)
                        } else {
                            HStack(alignment: .center, spacing: 12) {
                                Text("Confirm Transaction")
                                Image(systemName: "arrow.right")
                            }
                            .frame(width: geometry.size.width - 40, height: 60, alignment: .center)
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 17, weight: .semibold, design: .rounded))
                            .background(Color(red: 111/255, green: 115/255, blue: 210/255))
                            .cornerRadius(10)
                        }
                        
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
                .padding(.top, 20)
                .padding(.bottom, 100) // Add Space at bottom of Scroll View
            }
            
            
        }
        
    }
}

struct CartView_Previews: PreviewProvider {
    
    static var review:Review = Review(name: "John Smith", rating: 5.0, content: "This are sick! Best purchase I've made in a long time. Soooo slick!")
    static var product:Product = Product(uuid: "product123", image: Image("adidas"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [review])
    @State static var items:[Product] = [product, product, product]
    
    static var previews: some View {
        CartView(items: $items)
    }
}
