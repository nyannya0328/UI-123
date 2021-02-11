//
//  CartViewModel.swift
//  UI-123
//
//  Created by にゃんにゃん丸 on 2021/02/11.
//

import SwiftUI

class CartViewModel: ObservableObject {
    
    @Published var items = [
        
        Item(price: 100, isSwiped: false, image: "p1", name: "White T", offset: 0, quanty: 1, detatils: "L"),
        Item(price: 300, isSwiped: false, image: "p2", name: "Ball", offset: 0, quanty: 1, detatils: "Large"),
        Item(price: 600, isSwiped: false, image: "p3", name: "Every", offset: 0, quanty: 1, detatils: "M"),
        Item(price: 1200, isSwiped: false, image: "p4", name: "RED Ribon", offset: 0, quanty: 1, detatils: "S"),
        Item(price: 1500, isSwiped: false, image: "p5", name: "Hat & White", offset: 0, quanty: 1, detatils: "M S")
    
    
    ]
   
}

