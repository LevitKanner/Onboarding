//
//  PageView.swift
//  Onboarding
//
//  Created by Levit Kanner on 12/12/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct PageView: UIViewControllerRepresentable{
    
    //Properties
    var subviews: [UIViewController]
    @Binding var currentPageIndex: Int
    
    //Coordinator class
    class Coordinator: NSObject , UIPageViewControllerDelegate , UIPageViewControllerDataSource{
        
        let parent: PageView
        
        init( _ parent: PageView){
            self.parent = parent
        }
        
        
        //Data source functions for returning the view before the current view
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = parent.subviews.firstIndex(of: viewController) else {
                return nil
            }
            
            //shows the last view controller when the user swipes from the first view
            if index == 0 {
                return parent.subviews.last
            }
            
            return parent.subviews[index - 1]
        }
        
        
        //Data source function for returning the view after the current view
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = parent.subviews.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == parent.subviews.count {
                return parent.subviews.first
            }
            return parent.subviews[index + 1]
        }
        
        //Update currentPage when user swipes
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
                let visibleViewController = pageViewController.viewControllers?.first ,
                let index = parent.subviews.firstIndex(of: visibleViewController)
            {
                parent.currentPageIndex = index
            }
        }
        
        
        
    }
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<PageView>) -> UIPageViewController {
        let pageView = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageView.delegate = context.coordinator
        pageView.dataSource = context.coordinator
        return pageView
    }
    
    //Gets called each time the parent properties change
    func updateUIViewController(_ uiViewController: UIPageViewController, context: UIViewControllerRepresentableContext<PageView>) {
        uiViewController.setViewControllers([subviews[currentPageIndex]], direction: .forward, animated: true)
    }
    
    
    func makeCoordinator() -> PageView.Coordinator {
        Coordinator(self)
    }
  
    
}
