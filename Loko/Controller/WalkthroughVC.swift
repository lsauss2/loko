//
//  WalkthroughVC.swift
//  Loko
//
//  Created by Ludo on 06/11/2017.
//  Copyright © 2017 Ludo. All rights reserved.
//

import UIKit

class WalkthroughVC: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    
    let transitionManager = TransitionManager()
    
    let titleArray: [String] = ["Discover the best spots around you", "Share your favourite places with your friends", "Keep track of the new cool spots opening"]
    let imageArray: [String] = ["walkthrough1", "walkthrough-2", "walkthrough-3"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellWidth: CGFloat = 240
        let cellHeight: CGFloat = 290
        
        let insetX = (view.bounds.width - cellWidth) / 2.0
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: insetX, bottom: 0, right: insetX)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    @IBAction func getStartedBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_BOOKMARKS_LIST_FROM_WALKTHROUGH, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let toViewController = segue.destination as UIViewController
        toViewController.transitioningDelegate = self.transitionManager
    }
    

}

extension WalkthroughVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "walkthroughCell", for: indexPath) as! walkthroughCell
        cell.configureCell(image: imageArray[indexPath.row], title: titleArray[indexPath.row])
        return cell
        
    }
    
}

extension WalkthroughVC: UIScrollViewDelegate, UICollectionViewDelegate {
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
        
        self.pageControl.currentPage = Int(roundedIndex)
        
    }
    
}


