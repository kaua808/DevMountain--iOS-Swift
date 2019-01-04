//: Playground - noun: a place where people can play

import UIKit

enum HandShape {
    case rock
    case paper
    case scissors
}

enum MatchResult {
    case win
    case lose
    case draw
}

func match(shape1: HandShape, shape2: HandShape) -> MatchResult {
    
    switch(shape1, shape2) {
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            return .draw
        case (.rock, .scissors), (.scissors, .paper), (.paper, .rock):
            return .win
        default:
            return .lose
    }
}

match(.rock, shape2: .paper)
