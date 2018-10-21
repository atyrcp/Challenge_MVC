//
//  FullScreenViewController.swift
//  Challenge_MVC
//
//  Created by z on 2018/10/21.
//  Copyright © 2018年 z. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var fullScreenCollectionView: UICollectionView!
    
    
    var randomImages = [UIImage]()
    
    var currentImageIndex = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FullScreenImagesCollectionViewCell
        cell.fullScreenImages.image = randomImages[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fullScreenCollectionView.selectItem(at: IndexPath(item: currentImageIndex, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        fullScreenCollectionView.isPagingEnabled = true
    }
    


}
