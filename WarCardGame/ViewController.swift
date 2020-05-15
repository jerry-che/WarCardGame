//
//  ViewController.swift
//  WarCardGame
//
//  Created by Jerry Che on 5/11/20.
//  Copyright © 2020 Jerry Che. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var playerScore: UILabel!
    @IBOutlet weak var CPUScore: UILabel!
    
    var leftScore = 0
    var rightScore = 0
    var winner = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func dealTapped(_ sender: Any) {
        
        
        //randomize some numbers
        let leftNumber = Int.random(in: 2...14)
        
        let rightNumber = Int.random(in: 2...14)
        
        //Update the image views
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        if leftNumber > rightNumber{
            //left side wins
            leftScore += 1
            playerScore.text = String(leftScore)
            
        }
        
        if leftNumber < rightNumber{
            //Right side wins
            rightScore += 1
            CPUScore.text = String(rightScore)
            
        }
        
        else{
            //Tie
        }
        checkForWinner()
        
        
    }
    
    func checkForWinner(){
        if leftScore == 21{
            winner = "You"
            showAlertWinner()
        }
        if rightScore == 21{
            winner = "CPU"
            showAlertWinner()
        }
    }
    
    func showAlertWinner(){
          let alertController = UIAlertController(title: "Game is over. The winner is \(winner)!", message: "Press OK to restart", preferredStyle: .alert)
        let okAction = UIAlertAction(title:"OK", style: .default, handler: {action in self.GameReset()})
          alertController.addAction(okAction)
          present(alertController, animated: true, completion: nil)
      }
    
    func GameReset(){
        leftScore = 0
        playerScore.text = String(leftScore)
        rightScore = 0
        CPUScore.text = String(rightScore)
        
    }
    
}

 
