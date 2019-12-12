//
//  OnboardingView.swift
//  Onboarding
//
//  Created by Levit Kanner on 12/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI
import UIKit

struct OnboardingView: View {
    @State var currentPageIndex = 0
    
    var titles = ["Take some time out", "Conquer personal hindrances", "Create a peaceful mind"]
    
    var captions =  ["Take your time out and bring awareness into your everyday life", "Meditating helps you dealing with anxiety and other psychic problems", "Regular medidation sessions creates a peaceful inner mind"]
    
    var subviews = [
        UIHostingController(rootView: subview(imageName: "meditating")),
        UIHostingController(rootView: subview(imageName: "skydiving")),
        UIHostingController(rootView: subview(imageName: "sitting"))
    ]
    
    
    
    var body: some View {
        VStack(alignment: .leading){
            PageView(subviews: subviews , currentPageIndex: self.$currentPageIndex)
                .frame(height: 600)
            
            
            Group{
                Text(self.titles[currentPageIndex])
                    .font(.title)
                
                
                Text(self.captions[currentPageIndex])
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(nil)
                    .frame(width: 300 , height: 50 , alignment: .leading)
            }
            .padding()
            
            
            HStack{
                PageControl(numberOfPages: subviews.count, currentPageIndex: $currentPageIndex)
                Spacer()
                Button(action:{
                    if self.currentPageIndex + 1 == self.subviews.count{
                        self.currentPageIndex = 0
                    }else{
                        self.currentPageIndex += 1
                    }
                }){
                    Image(systemName: "arrow.right")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 30 , height: 30)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(30)
                    
                }
            }
        .padding()
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
