//
//  Credit.swift
//  MyCreditManager
//
//  Created by Roen White on 2023/04/30.
//

import Foundation

enum Credit: String {
    case Aplus = "A+"
    case A  = "A"
    case Bplus = "B+"
    case B  = "B"
    case Cplus = "C+"
    case C  = "C"
    case Dplus = "D+"
    case D  = "D"
    case F  = "F"
    
    var point: Double {
        switch self {
        case .Aplus: return 4.5
        case .A    : return 4.0
        case .Bplus: return 3.5
        case .B    : return 3.0
        case .Cplus: return 2.5
        case .C    : return 2.0
        case .Dplus: return 1.5
        case .D    : return 1.0
        case .F    : return 0
        }
    }
}
