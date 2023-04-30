//
//  Student.swift
//  MyCreditManager
//
//  Created by Roen White on 2023/04/30.
//

import Foundation

struct Student {
    let name: String
    var credits: [String: Credit] = [:]
    var score: Double {
        let totalPoints: Double = credits.values.reduce(0) { $0 + $1.point }
        return totalPoints / Double(credits.count)
    }
    
    init(name: String) {
        self.name = name
    }
}
