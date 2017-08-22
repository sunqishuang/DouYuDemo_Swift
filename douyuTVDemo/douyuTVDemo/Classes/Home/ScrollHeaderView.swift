//
//  ScrollHeaderView.swift
//  douyuTVDemo
//
//  Created by 孙启双 on 2017/8/7.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit

import SDCycleScrollView


class ScrollHeaderView: UICollectionReusableView,SDCycleScrollViewDelegate {
    
    var bannerView:SDCycleScrollView?
    
    
    var dataList :[RecommandBannerModel]! {
        didSet{
            let imageGroup: NSMutableArray = NSMutableArray()
            for model in dataList{

                imageGroup.add(model.pic_url)
                
                print("name ==== \(model.room?.romm_id)")
            }
            
            self.bannerView?.imageURLStringsGroup = imageGroup as! [Any]
        }
    }
    
    
    
    override init(frame: CGRect) {
        dataList = []
        
        super.init(frame: frame)
        bannerView = SDCycleScrollView.init(frame: CGRect(x:0, y:0, width:K_Width, height:K_Width * 42/108.0), delegate: self, placeholderImage: UIImage(named:"banner_default"))
        
        bannerView?.currentPageDotColor = .orange
        bannerView?.pageDotColor = .lightGray
        bannerView?.bannerImageViewContentMode = .scaleAspectFill

        self.addSubview(bannerView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int){
        
    }
    
    
    
}
