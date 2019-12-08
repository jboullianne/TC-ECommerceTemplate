//
//  Product.swift
//  EcommerceTemplate
//
//  Created by Jean-Marc Boullianne on 12/2/19.
//  Copyright © 2019 Jean-Marc Boullianne. All rights reserved.
//

import Foundation
import SwiftUI

struct Product {
    var uuid:String
    var image:Image
    var title:String
    var price:Double
    var description:String
    var reviews:[Review]
    
    var rating:Double {
        get {
            reviews.reduce(0) { (res, review) -> Double in
                res + review.rating
            }
        }
    }
}

struct Review {
    var name:String
    var rating:Double
    var content:String
}
