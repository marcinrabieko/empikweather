//
//  String+Localizable.swift
//  Empik Weather
//
//  Created by Marcin Rabieko on 11/12/2023.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
