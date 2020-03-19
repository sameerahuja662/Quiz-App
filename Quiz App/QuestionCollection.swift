//
//  QusetionCollection.swift
//  Quiz App
//
//  Created by Sameer Ahuja on 2020-02-12.
//  Copyright © 2020 Sameer Ahuja. All rights reserved.
//

import Foundation

//Class to store a list of type Question.List contains quiz questions.
class QuestionCollection{
    var list = [Question]()
    //Initialising class and appending data onto the list.
    init() {
        list.append(Question(questionText: "What is the capital of Russia ?", choiceA: "A. New York", choiceB: "B. Kazan", choiceC: "C. Beijing", choiceD: "D. Moscow", answer: 4))
        
        list.append(Question(questionText: "The highest mountain in the world ?", choiceA: "A. K2", choiceB: "B. Makalu", choiceC: "C. Mount Everest", choiceD: "D. Mansalu", answer: 3))
        
        list.append(Question(questionText: "Where is Eiffel tower located ?", choiceA: "A. London", choiceB: "B. Paris", choiceC: "C. Amsterdam", choiceD: "D. Cayman Islands", answer: 2))
        
        list.append(Question(questionText: "This country has a magnificent underwater cave system.", choiceA: "A. The Bahamas", choiceB: "B. Venezuela", choiceC: "C. Matinique", choiceD: "D. Dominican Republic", answer: 1))
        
        list.append(Question(questionText: "Which is the fastest land animal ? ", choiceA: "A. Tiger" , choiceB: "B. Jaguar" , choiceC: "C. Panther" , choiceD: "D. Cheetah", answer: 4))
        
        
    }
}

