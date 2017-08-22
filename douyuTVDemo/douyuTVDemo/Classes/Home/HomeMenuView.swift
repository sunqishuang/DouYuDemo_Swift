//
//  HomeMenuView.swift
//  douyuTVDemo
//
//  Created by 孙启双 on 2017/8/7.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit

class HomeMenuView: UICollectionViewCell,UIScrollViewDelegate {
    

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var dataMenu:NSMutableArray? {
        didSet{
        
            for  subview in scrollView.subviews{
                subview.removeFromSuperview()
            }
            
            if ((dataMenu?.count)! > 0 && (dataMenu?.count)! <= 8) {
                 //一个collectionView
            }else if (dataMenu?.count)! <= 16{
                //刚好两个
            }else{
                
            }

        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    
        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        pageControl.hidesForSinglePage = true
    
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let offsetX = Int (scrollView.contentOffset.x/K_Width)
        
        pageControl.currentPage = offsetX
        
        
        
    }

}
