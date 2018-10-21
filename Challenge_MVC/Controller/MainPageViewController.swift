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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("array count: \(randomImageDataArray.count)")
        
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
            print("this is cell 0")
            let cell = tableView.dequeueReusableCell(withIdentifier: "searchBarCell", for: indexPath) as! SearchBarTableViewCell
            return cell
        case 1:
            print("this is cell 1")
            let cell = tableView.dequeueReusableCell(withIdentifier: "keywordsCell", for: indexPath) as! KeywordsTableViewCell
            cell.mainCollectionView.reloadData()
            
            return cell
        case 2:
            
            print("this is cell 2")
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "randomImageCell", for: indexPath) as! RandomImageTableViewCell
            
            cell.displayImage(from: randomImages[indexPath.row])
            return cell
            
        default:
            print("something wrong")
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
            print("row height first?")
            return tableView.frame.width / imageRatios[indexPath.row]
        default:
            return 0
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("im in collection cells")
        return randomImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "KeywordsImageCollectionViewCell", for: indexPath) as! KeywordsImageCollectionViewCell
        
        print("try to add some image in collection cells")
        
        cell.keywordsImageView.image = randomImages[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
        print("on here \(indexPath.row)")
    }
    
    

    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("begins")
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        APIrequest.askForImage(from: "photos/random?count=20") { (responseData, error) in
            self.randomImages = APIrequest.createImages(from: responseData)
            self.imageRatios = APIrequest.createRatios(from: responseData)
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.mainTableView.reloadData()
        }
        print("github test, first time to push")
    }

}
