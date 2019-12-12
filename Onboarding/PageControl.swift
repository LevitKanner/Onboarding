//
//  PageControl.swift
//  Onboarding
//
//  Created by Levit Kanner on 12/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct PageControl: UIViewRepresentable{
    var numberOfPages: Int
    @Binding var currentPageIndex: Int
    
    
    class Coordinator: NSObject{
        
    }
    
    func makeUIView(context: UIViewRepresentableContext<PageControl>) -> UIPageControl {
        let pageControl = UIPageControl()
        pageControl.currentPage = currentPageIndex
        pageControl.numberOfPages = numberOfPages
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        pageControl.pageIndicatorTintColor = UIColor.gray
        return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: UIViewRepresentableContext<PageControl>) {
        uiView.currentPage = currentPageIndex
    }
    
    func makeCoordinator() -> PageControl.Coordinator {
        Coordinator()
    }
    
}
