//
//  String+SearchValidation.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 13/12/2023.
//

import Foundation

extension String {
    func validate(pattern: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        return predicate.evaluate(with: self)
    }
}
