//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by TOP on 3/11/2560 BE.
//  Copyright © 2560 TOPP Pongsakorn. All rights reserved.
//

import Foundation
import UIKit


private let reuseIdentifier = "MemeCollectionViewCell"

class MemeCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var memes: [Meme]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        sampleMeme()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        
        let space: CGFloat = 3.0
        let dimension = (self.view.frame.size.width - (2 * space))/3
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        collectionView?.reloadData()
        
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    // meme sample for test purpose.
    func sampleMeme() {
        if let image = UIImage(named: "defaultphoto") {
            let meme = Meme(topText: "new", bottomText: "Test", originalImage: image, image: image)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.memes.append(meme)
            print(image)
        } else {
            print("notLoad")
        }
    
    }

    
    // MARK: UICollectionViewDataSource
//    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCollectionViewCell
        
        
        // Configure the cell
        let meme = memes[indexPath.row]
        cell.imageView?.image = meme.image
        
        return cell
    }

    
  
    // MARK: - Navigation
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let meme = memes[indexPath.row]
        
        let detailController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailController.meme = meme
        
        self.navigationController?.pushViewController(detailController, animated: true)
    }

}
