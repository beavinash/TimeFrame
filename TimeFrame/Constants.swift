//
//  Constants.swift
//  TimeFrame
//
//  Created by Avinash Reddy on 1/17/17.
//  Copyright © 2017 theEine. All rights reserved.
//

import Foundation

import UIKit

let SHADOW_GRAY: CGFloat = 120.0 / 255.0

let SEGUE_ADD = "addSegue"

class Utilities {
    
    func ShowAlert (title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true, completion: nil)
    }
    
    //    func GetDate () -> String {
    //        let today: Date = Date()
    //        let dateFormatter: DateFormatter = DateFormatter()
    //        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
    //        return dateFormatter.string(from: today)
    //    }
    
}
