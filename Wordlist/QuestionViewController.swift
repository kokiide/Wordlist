//
//  QuestionViewController.swift
//  Wordlist
//
//  Created by Koki Ide on 2017/04/21.
//  Copyright © 2017 kokiide. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var nextButton:UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    var isAnswered: Bool = false
    var wordArray: [Dictionary<String, String>] = [ ]
    var shuffledWordArray: [Dictionary<String, String>] = []
    var nowNumber: Int = 0
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = " "

        // Do any additional setup after loading the view.
    }
    
    //viewが現れた時に呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        //問題をシャッフルする
        shuffle()
        questionLabel.text = shuffledWordArray[nowNumber]["english"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func shuffle(){
        while wordArray.count > 0 {
            let index = Int(arc4random()) % wordArray.count
            shuffledWordArray.append(wordArray[index])
            wordArray.remove(at: index)
        }
    }
    @IBAction func nextButtonTapped() {
        if isAnswered {
            nowNumber += 1
            answerLabel.text = ""
            
            if nowNumber < shuffledWordArray.count {
                questionLabel.text = shuffledWordArray[nowNumber]["english"]
                isAnswered = false
                nextButton.setTitle("答えを表示", for: .normal)
            } else {
                self.performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        } else {
            answerLabel.text = shuffledWordArray[nowNumber]["japanese"]
            isAnswered = true
            nextButton.setTitle("次へ", for: .normal)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
