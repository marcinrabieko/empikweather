//
//  Double+Temperature.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 13/12/2023.
//

import UIKit

extension Double {
    var color: UIColor {
        if self < 10 {
            return UIColor.blue
        } else if self < 20 {
            return UIColor.black
        } else {
            return UIColor.red
        }
    }
}
