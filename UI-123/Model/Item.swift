//
//  Item.swift
//  UI-123
//
//  Created by にゃんにゃん丸 on 2021/02/11.
//

import SwiftUI

struct Item: Identifiable {
    
    var id = UUID().uuidString
    var price : Float
    var isSwiped : Bool
    var image : String
    var name : String
    var offset : CGFloat
    var quanty : Int
    var detatils : String
    
}

