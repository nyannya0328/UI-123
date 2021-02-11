//
//  Cartview.swift
//  UI-123
//
//  Created by にゃんにゃん丸 on 2021/02/11.
//

import SwiftUI

var rad = RadialGradient(gradient: .init(colors: [.blue,.purple]), center: .center, startRadius: 100, endRadius: 500)

struct Cartview: View {
    @EnvironmentObject var model : CartViewModel
    var body: some View {
        VStack{
            
            HStack(spacing:10){
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .font(.system(size: 30, weight: .heavy))
                        
                    Text("Cart")
                        .font(.title)
                        .font(.system(size: 30, weight: .heavy))
                    
                })
                Spacer()
                
            }
            .foregroundColor(.black)
            .shadow(color: Color.green, radius: 10, x: 10, y: 10)
            .shadow(color: Color.red, radius: 10, x: 10, y: 10)
            .padding()
            
            ScrollView{
                
                
                LazyVStack(spacing:0){
                    
                    ForEach(model.items){item in
                        
                        ItemView(item: $model.items[setindex(item: item)], items: $model.items)
                        
                        
                        
                    }
                    
                    
                }
                .padding()
                
                VStack{
                    
                    HStack{
                        
                        Text("Total")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text(caluculateTotalprice())
                            .font(.title)
                            
                            .foregroundColor(.green)
                            
                        
                    }
                    .padding(([.top,.horizontal]))
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Check Out")
                            .font(.title2)
                            .font(.system(size: 50, weight: .heavy))
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(rad)
                            .cornerRadius(10)
                    })
                    
                }
                .background(Color.white)
                
                
                
                
                
                
                
            }
            
        }
        .background(Color.gray.opacity(0.03).ignoresSafeArea())
    }
    
    func setindex(item : Item) -> Int{
        
        return model.items.firstIndex { (item1) -> Bool in
            return item.id == item1.id
        } ?? 0
    }
    
    func caluculateTotalprice() -> String{
        
        var price : Float = 0
        
        model.items.forEach { (item) in
            price += Float(item.quanty) * item.price
        }
        
        return getprice(value : price)
        
        
        
    
        
        
        
    }
}

struct Cartview_Previews: PreviewProvider {
    static var previews: some View {
        Cartview()
    }
}
