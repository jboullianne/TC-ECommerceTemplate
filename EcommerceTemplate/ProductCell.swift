//
//  ProductCell.swift
//  EcommerceTemplate
//
//  Created by Jean-Marc Boullianne on 12/4/19.
//  Copyright © 2019 Jean-Marc Boullianne. All rights reserved.
//

import SwiftUI

struct ProductCell: View {
    
    var product:Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            product.image
                .resizable()
                .scaledToFill()
                .cornerRadius(10)
                
            Text(product.title)
                .font(Font.system(size: 15, weight: .regular, design: .rounded))
            Text("$\(String(format: "%.2f", product.price))")
                .font(Font.system(size: 15, weight: .heavy, design: .rounded))
        }
        .aspectRatio(contentMode: .fit)
        
    }
}

struct ProductCell_Previews: PreviewProvider {
    
    static var product:Product = Product(uuid: "product123", image: Image("product01"), title: "Adidas Limited Edition 100P", price: 130.00, description: "Limited Edition Adidas are surely to bring you some street cred with these fresh kicks.", reviews: [Review(name: "John Smith", rating: 5.0, content: "This are sick! Best purchase I've made in a long time. Soooo slick!")])
    
    static var previews: some View {
        ProductCell(product: product)
    }
}
