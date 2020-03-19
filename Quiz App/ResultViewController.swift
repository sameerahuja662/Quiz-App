//
//  ResultViewController.swift
//  Quiz App
//
//  Created by Sameer Ahuja on 2020-02-12.
//  Copyright © 2020 Sameer Ahuja. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    //Variable for storing score.
    var resultingScore: Int = 0
    //Outlet for Result message.
    @IBOutlet weak var resultMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Showing the final score on screen.
        resultMessage.text = "Your Score was \(resultingScore)"
        
        //Hiding the back button for Navigation Item.
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    //Action method for Restart quiz button.
    @IBAction func goToRootController(_ sender: Any) {
        //Performing a Segue to first screen.
        self.performSegue(withIdentifier: "restartQuizSegue", sender: nil)
    }
    
    
}
