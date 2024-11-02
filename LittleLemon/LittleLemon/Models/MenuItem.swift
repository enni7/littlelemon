//
//  MenuItem.swift
//  LittleLemon
//
//  Created by Anna Izzo on 31/10/24.
//

import Foundation

struct MenuItem: Decodable {
    let title: String?
    let image: String?
    let price: String?
    let category: String?
}

enum MenuCategory: String, CaseIterable {
    case starters
    case mains
    case desserts
    case drinks
}
