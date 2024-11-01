//
//  String+Extensions.swift
//  LittleLemon
//
//  Created by Anna Izzo on 27/10/24.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegex = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,64}$"
        let emailPredicate = NSPredicate(format: "SELF MATCHES[c] %@",emailRegex)
        return emailPredicate.evaluate(with: self)
    }
}
