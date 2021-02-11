//
//  ContentView.swift
//  UI-123
//
//  Created by にゃんにゃん丸 on 2021/02/11.
//

import SwiftUI

struct ContentView: View {
    
    @State var animated = false
    @State var endsplash = false
    
    var body: some View {
        ZStack{
            
            
          
            
            ZStack{
                
                Color("bg")
                
                Image("large")
                    .resizable()
                    .aspectRatio(contentMode: animated ? .fill : .fit)
                    .frame(width:animated ? nil : 85, height:animated ? nil : 85)
                
                
                
            }
            .onAppear(perform: animatedsplash)
            .ignoresSafeArea(.all, edges: .all)
            .opacity(endsplash ? 0 : 1)
        }
    }
    
    func animatedsplash(){
        
        DispatchQueue.main.async {
            withAnimation(.easeInOut){
                
                animated.toggle()
                
            }
            
            withAnimation(.easeInOut){
                
                endsplash.toggle()
                
            }
        }
        
        
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
