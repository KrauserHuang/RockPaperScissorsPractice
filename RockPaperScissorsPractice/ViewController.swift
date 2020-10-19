//
//  ViewController.swift
//  RockPaperScissorsPractice
//
//  Created by Tai Chin Huang on 2020/10/16.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var robotLabel: UILabel! //Alpha出拳顯示
    @IBOutlet weak var playerLabel: UILabel! //Player出拳顯示
    @IBOutlet weak var infoLabel: UILabel! //結果顯示
    @IBOutlet weak var playerScores: UILabel! //Player分數
    @IBOutlet weak var robotScores: UILabel! //Alpha分數
    @IBOutlet weak var playAgainButton: UIButton! //再玩一次
    var handsLabel = ["👊", "🖐", "✌️"] //隨機變數猜拳
    var playerScoreNumber = 0
    var robotScoreNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerLabel.isHidden = true
        playAgainButton.isHidden = true
    }
    //隨機猜拳
    func robotRandom() {
        let randomDistribution = GKRandomDistribution(lowestValue: 0, highestValue: handsLabel.count-1)
        for _ in 0..<handsLabel.count {
            let index = randomDistribution.nextInt()
            robotLabel.text = handsLabel[index]
        }
    }
    //判斷輸或贏
    func result() {
        if playerLabel.text == "👊" {
            switch robotLabel.text {
            case "👊":
                infoLabel.text = "Even!"
            case "🖐":
                infoLabel.text = "Loss!"
                robotScoreNumber += 1
                robotScores.text = "\(robotScoreNumber)"
            default:
                infoLabel.text = "Win!"
                playerScoreNumber += 1
                playerScores.text = "\(playerScoreNumber)"
            }
        } else if playerLabel.text == "🖐" {
            switch robotLabel.text {
            case "👊":
                infoLabel.text = "Win!"
                playerScoreNumber += 1
                playerScores.text = "\(playerScoreNumber)"
            case "🖐":
                infoLabel.text = "Even!"
            default:
                infoLabel.text = "Loss!"
                robotScoreNumber += 1
                robotScores.text = "\(robotScoreNumber)"
            }
        } else if playerLabel.text == "✌️"{
            switch robotLabel.text {
            case "👊":
                infoLabel.text = "Loss!"
                robotScoreNumber += 1
                robotScores.text = "\(robotScoreNumber)"
            case "🖐":
                infoLabel.text = "Win!"
                playerScoreNumber += 1
                playerScores.text = "\(playerScoreNumber)"
            default:
                infoLabel.text = "Even!"
            }
        }
    }
    //用UIAlertController判斷遊戲結束
    func gameOver() {
        if playerScoreNumber == 5 {
            let alertController = UIAlertController(
                title: "- Game over -",
                message: "You have won Alpha 2020, you're the champion!",
                preferredStyle:.alert)
            let okButton = UIAlertAction(
                title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in})
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: nil)
            playAgainButton.isHidden = false
        }
        if robotScoreNumber == 5 {
            let alertController = UIAlertController(
                title: "- Game over -",
                message: "Too bad you didn't win Alpha 2020",
                preferredStyle:.alert)
            let okButton = UIAlertAction(
                title: "OK", style: .default, handler: {(action: UIAlertAction!) -> Void in})
            alertController.addAction(okButton)
            self.present(alertController, animated: true, completion: nil)
            playAgainButton.isHidden = false
        }
    }
    
    @IBAction func rockButton(_ sender: UIButton) {
        playerLabel.text = "👊"
        robotRandom()
        result()
        playerLabel.isHidden = false
        gameOver()
    }
    @IBAction func paperButton(_ sender: UIButton) {
        playerLabel.text = "🖐"
        robotRandom()
        result()
        playerLabel.isHidden = false
        gameOver()
    }
    @IBAction func scissorsButton(_ sender: UIButton) {
        playerLabel.text = "✌️"
        robotRandom()
        result()
        playerLabel.isHidden = false
        gameOver()
    }
    @IBAction func againButton(_ sender: UIButton) {
        robotLabel.text = "🤖"
        infoLabel.text = "Rock, Paper, Scissors?"
        playerScoreNumber = 0
        robotScoreNumber = 0
        playerScores.text = "\(playerScoreNumber)"
        robotScores.text = "\(robotScoreNumber)"
        playAgainButton.isHidden = true
        playerLabel.isHidden = true
    }
}

