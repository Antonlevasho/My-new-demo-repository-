//
//  Setting circle.swift
//  To-do list
//
//  Created by Анастасия on 20.03.2024.
//

import Foundation
import UIKit

class Circle: TableViewController {

 func settingCircle() {
    
     let circle1 = creatingCircle(frame: CGRect(x: 44, y: -31, width: 162, height: 162)) 
}

private func creatingCircle(frame: CGRect) -> UIView {
    
    let circle = UIView()
    circle.backgroundColor = UIColor(named: "circle1")
    circle.frame = frame
    circle.layer.cornerRadius = frame.width / 2
    
    return circle
}
    
    
    
}
