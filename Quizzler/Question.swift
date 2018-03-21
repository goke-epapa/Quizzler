//
//  Question.swift
//  Quizzler
//
//  Created by Adegoke Obasa on 21/03/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionText : String
    let answer : Bool
    
    init(text: String, correctAnser: Bool) {
        questionText = text
        answer = correctAnser
    }
}
