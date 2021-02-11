//
//  ItemView.swift
//  UI-123
//
//  Created by にゃんにゃん丸 on 2021/02/11.
//

import SwiftUI

struct ItemView: View {
    @Binding var item : Item
    @Binding var items : [Item]
    var body: some View {
        ZStack{
            
           rad
            
            HStack{
                
                Spacer()
                
                Button(action: {
                    
                    withAnimation(.easeOut){
                        
                        deleteitem()
                        
                    }
                    
                }, label: {
                    Image(systemName: "trash.fill")
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(width: 90, height: 50)
                })
            }
            .padding()
            
            
            HStack{
                
                Image(item.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 130)
                    .cornerRadius(10)
                
                VStack(alignment: .leading, spacing: 15, content: {
                    
                    Text(item.name)
                        .font(.title)
                    
                    Text(item.detatils)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    HStack(spacing:10){
                        
                        Text("\(getprice(value: item.price))円")
                            .font(.title)
                            .fontWeight(.light)
                            .foregroundColor(.black)
                        
                        
                        Spacer()
                        
                        Button(action: {
                            
                            if item.quanty > 1{item.quanty -= 1}
                            
                        }, label: {
                            Image(systemName: "minus")
                                .font(.title)
                                .foregroundColor(.gray)
                                
                        })
                        
                        Text("\(item.quanty)")
                            .font(.title)
                            .foregroundColor(.blue)
                        
                        
                        Button(action: {
                            item.quanty += 1
                            
                        }, label: {
                            Image(systemName: "plus")
                                .font(.title)
                                .foregroundColor(.gray)
                                
                        })
                        
                        
                        
                        
                        
                    }
                    
                })
                
            }
            .padding()
            .background(Color.gray.opacity(0.5))
            .contentShape(Rectangle())
            .offset(x: item.offset)
            .gesture(DragGesture().onChanged(onchanged(value:)).onEnded(onEnd(value:)))
        }
    }
    func onchanged(value:DragGesture.Value){
        if value.translation.width < 0{
            
       
            if item.isSwiped{
                item.offset = value.translation.width - 90
            }
            else{
                item.offset = value.translation.width
            }
        }
        
        
        
    }
    func onEnd(value:DragGesture.Value){
        
        withAnimation(.easeOut){
            
            if value.translation.width < 0{
                
                if -value.translation.width > UIScreen.main.bounds.width / 2{
                    
                    item.offset = -1000
                    deleteitem()
                    
                }
                else if -item.offset > 50{
                    item.isSwiped = true
                    item.offset = -90
                }
                else{
                    item.offset = 0
                    item.isSwiped = false
                }
                
            }
            else{
                item.isSwiped = false
                item.offset = 0
            }
            
        }
        
        
    }
    func deleteitem(){
        
        items.removeAll { (item) -> Bool in
            
            return self.item.id == item.id
        }
        
        
        
    }
    
   
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        Cartview()
    }
}
func getprice(value:Float)->String{
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter.string(from: NSNumber(value:value)) ?? ""
    
}
