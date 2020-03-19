//
//  QuizViewController.swift
//  Quiz App
//
//  Created by Sameer Ahuja on 2020-02-11.
//  Copyright © 2020 Sameer Ahuja. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    
    var username:String = ""
    
    // Setting outlets for labels.
    @IBOutlet weak var questionCount: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var question: UILabel!
    // Outlets for buttons
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    //Outlet for progress bar.
    @IBOutlet weak var levelProgress: UIProgressView!
    
    //Creating object of QuestionCollection
    let questionCollection = QuestionCollection()
    //Variables for keeping track of progress and score.
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting the Player Name.
        userNameLabel?.text = username
        //Hiding the Back button for naviagtion controller.
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        //Method to show questions.
        updateQuestion()
        
        
    }
    
    //Setting one Action for all answer button options.
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //Checking for button that sent the event through tags.
        if sender.tag == selectedAnswer {
            score += 1
            //Button flashes green if answer is correct.
            UIView.animate(withDuration: 0.2) {
                
                sender.backgroundColor =  UIColor.green
            }
            
        }else{
            //Button flashes red if the answer is incorrect.
            UIView.animate(withDuration: 0.2) {
                sender.backgroundColor =  UIColor.red
            }
        }
        
        questionNumber += 1
        updateQuestion()
        
    }
    //Method to load questions and answer chioces into view.
    func updateQuestion(){
        
        if questionNumber <= questionCollection.list.count - 1{
            
            question.text = questionCollection.list[questionNumber].question
            option1.setTitle(questionCollection.list[questionNumber].optionA, for: UIControl.State.normal)
            option2.setTitle(questionCollection.list[questionNumber].optionB, for: UIControl.State.normal)
            option3.setTitle(questionCollection.list[questionNumber].optionC, for: UIControl.State.normal)
            option4.setTitle(questionCollection.list[questionNumber].optionD, for: UIControl.State.normal)
            selectedAnswer = questionCollection.list[questionNumber].correctAnswer
            updateUI()
            
        }else {
            //When 5 questions have been attempted.
            updateUI()
            restartQuiz()
            
        }
        
        
    }
    
    //Method for loading score and progress updates.
    func updateUI(){
        
        UIView.animate(withDuration: 0.5) {
            
            self.option1.backgroundColor = UIColor.blue
            self.option2.backgroundColor = UIColor.blue
            self.option3.backgroundColor = UIColor.blue
            self.option4.backgroundColor = UIColor.blue
        }
        //Updating the progress bar level.
        levelProgress.setProgress(Float((questionNumber * 2) + 2)/10, animated: true)
        
        questionCount.text = "\(questionNumber + 1)/\(questionCollection.list.count)"
        
    }
    
    //Method to trigger a segue when quiz ends.
    func restartQuiz(){
        
        //perform segue when quiz is over.
        self.performSegue(withIdentifier: "resultSegue", sender: nil)
        score = 0
        questionNumber = 0
        
    }
    //Sending the resulting score with the segue.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is ResultViewController
        {
            //Accessing the property of ResultViewController.
            let vc = segue.destination as? ResultViewController
            vc?.resultingScore = score
        }
    }
    
    
}
