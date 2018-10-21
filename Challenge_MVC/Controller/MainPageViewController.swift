//
//  MainPageViewController.swift
//  Challenge_MVC
//
//  Created by z on 2018/10/18.
//  Copyright © 2018年 z. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var randomImageDataArray = [RandomImage]()
    
    var randomImages = [UIImage]()
    
    var imageRatios = [CGFloat]()
    
    var currentImageIndex = 0
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            print("returning cell 2")
            return randomImages.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchBarCell", for: indexPath) as! SearchBarTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "keywordsCell", for: indexPath) as! KeywordsTableViewCell
            cell.mainCollectionView.reloadData()
            
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "randomImageCell", for: indexPath) as! RandomImageTableViewCell
            cell.displayOutLook(from: randomImages[indexPath.row], from: randomImageDataArray[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return CGFloat(200)
        case 1:
            return CGFloat(200)
        case 2:
            return tableView.frame.width / imageRatios[indexPath.row]
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentImageIndex = indexPath.row
        performSegue(withIdentifier: "FullScreen", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! FullScreenViewController
        destination.randomImages = self.randomImages
        destination.currentImageIndex = self.currentImageIndex
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KeywordsImageCollectionViewCell", for: indexPath) as! KeywordsImageCollectionViewCell
        
        cell.keywordsImageView.image = randomImages[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        APIrequest.shared.askForImage(from: "photos/random?count=20") { (responseData, error) in
            self.randomImageDataArray = responseData
            self.randomImages = APIrequest.createImages(from: responseData)
            self.imageRatios = APIrequest.createRatios(from: responseData)
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.mainTableView.reloadData()
        }
    }

}
