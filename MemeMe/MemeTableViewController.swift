//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by TOP on 3/14/2560 BE.
//  Copyright © 2560 TOPP Pongsakorn. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes: [Meme]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        samplyMeme()
        self.tableView.delegate = self
        self.tableView.dataSource = self

    }
    
    func samplyMeme() {
        if let image = UIImage(named: "defaultphoto") {
            let meme = Meme(topText: "new", bottomText: "Test", originalImage: image, image: image)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.memes.append(meme)
            print(image)
        } else {
            print("notLoad")
        }
       
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        tableView.reloadData()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return memes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MemeTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MemeTableViewCell
        let meme = memes[indexPath.row]
        cell.topText.text = meme.topText
        cell.bottomText.text = meme.bottomText
        cell.imageView?.image = meme.image

        return cell
    }

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        super.prepare(for: segue, sender: sender)
//        
//        if segue.identifier == "showDetail" {
//            guard let controller = segue.destination as? DetailViewController else {
//                fatalError("Unexpected destination: \(segue.destination)")
//            }
//            guard let selectedCell = sender as? MemeTableViewCell else {
//                fatalError("Unexpected sender: \(sender)")
//            }
//            guard let indexPath = tableView.indexPath(for: selectedCell) else {
//                fatalError("The selected cell is not being displayed by the table")
//            }
//            controller.memeImage.image = memes[(indexPath.row)].image
//        }
//        
//    }
 
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let meme = memes[indexPath.row]
        
        let detailController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailController.meme = meme
        
        self.navigationController?.pushViewController(detailController, animated: true)
        
    }
    
    
 

}
