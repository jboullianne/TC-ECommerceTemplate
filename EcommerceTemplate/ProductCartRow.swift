//
//  ProductCartRow.swift
//  EcommerceTemplate
//
//  Created by Jean-Marc Boullianne on 12/2/19.
//  Copyright © 2019 Jean-Marc Boullianne. All rights reserved.
//

import SwiftUI

struct ProductCartRow: View {
    
    var item:Product
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            item.image
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80, alignment: .center)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
            VStack(alignment: .leading, spacing: 12) {
                Text("\(item.title)")
                    .font(Font.system(size: 17, weight: .regular, design: .rounded))
                Text("$\(String.init(format: "%.2f", item.price))")
                    .font(Font.system(size: 17, weight: .bold, design: .rounded))
            }
            
            Spacer()
                /*
            
            VStack(alignment: .center, spacing: 12) {
                Text("1x")
                    .font(Font.system(size: 17, weight: .heavy, design: .rounded))
                    .frame(width: 30, height: 30, alignment: .center)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1))
                Text("S")
                    .font(Font.system(size: 17, weight: .heavy, design: .rounded))
                    .foregroundColor(Color.white)
                    .frame(width: 30, height: 30, alignment: .center)
                    .background(Color(red: 199/255, green: 219/255, blue: 227/255))
                    .cornerRadius(35/2.0)
            }
                */
            
        }
    }
}

struct ProductCartRow_Previews: PreviewProvider {
    static var review:Review = Review(name: "John Smith", rating: 5.0, content: "This are sick! Best purchase I've made in a long time. Soooo slick!")
    @State static var item:Product = Product(uuid: "product123", image: Image("adidas"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [review])
    
    static var previews: some View {
        ProductCartRow(item: item)
    }
}
