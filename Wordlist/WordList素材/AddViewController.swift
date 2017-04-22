//
//  AddViewController.swift
//  Wordlist
//
//  Created by Koki Ide on 2017/04/21.
//  Copyright © 2017 kokiide. All rights reserved.
//

import UIKit

class AddViewController: UITableViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if saveData.array(forKey:"WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    @IBAction func saveWord() {
        let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
        
        wordArray.append(wordDictionary)
        saveData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title:"保存完了",
            message:"単語の登録が完了しました",
            preferredStyle: .alert
    )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        self.present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
    
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
