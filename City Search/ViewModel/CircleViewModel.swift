//
//  CircleViewModel.swift
//  City Search
//
//  Created by Alan Lira on 6/10/16.
//  Copyright © 2016 Alan Lira. All rights reserved.
//

import ChameleonFramework
import Foundation
import RxSwift
import RxCocoa

class CircleViewModel {
    
    var centerVariable = Variable<CGPoint?>(CGPointZero) // Create one variable that will be changed and observed
    var backgroundColorObservable: Observable<UIColor>! // Create observable that will change backgroundColor based on center
    
    init() {
        setup()
    }
    
    func setup() {
        // When we get center, emit new UIColor
        backgroundColorObservable = centerVariable.asObservable()
            .map({ center in
                guard let center = center else {
                    return UIColor.flatten(UIColor.blackColor())()
                }
                
                let blue: CGFloat = ((center.x + center.y) % 255.0) / 255.0 // We just manipulate blue, but you can do w/e
                let red: CGFloat = 0.0
                let green: CGFloat = 0.0
                
                return UIColor.flatten(UIColor(red: red, green: green, blue: blue, alpha: 1.0))()
        })
        
    }
}