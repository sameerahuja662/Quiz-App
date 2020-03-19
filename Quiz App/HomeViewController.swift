//
//  ViewController.swift
//  Quiz App
//
//  Created by Sameer Ahuja on 2020-02-11.
//  Copyright © 2020 Sameer Ahuja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    //Declaring Variables
    var nameText: String = ""
    
    // Outlets for text fields.
    @IBOutlet weak var userNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initialising Text fields. Empty text field when view loads again.
        userNameField.text = nameText
        
        //Hide the back button for navigation controller.
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    //Prepare data to send to next scene when segue starts.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is QuizViewController
        {
            //Accessing property of QuizViewController.
            let vc = segue.destination as? QuizViewController
            vc?.username = userNameField.text!
        }
    }

    //Action function for submit button.
    @IBAction func submitName(_ sender: Any) {
        
        //Validating user input.
        if userNameField.text != "" {
            self.performSegue(withIdentifier: "quizGameSegue", sender: nil)
        }else{
            //Creating an alert message if user input is invalid.
            let alert = UIAlertController(title: "Player Name cannot be left empty!", message: "Please enter your player name.", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true)
        }
        
    }
    //Resigning the keyboard when tap outside the keyboard.
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        userNameField.resignFirstResponder()
        
    }
    
}

