//
//  NormalItemCell.swift
//  douyuTVDemo
//
//  Created by 孙启双 on 2017/8/4.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit

class NormalItemCell: UICollectionViewCell {
    
    @IBOutlet weak var mainBgView: UIView!
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var roomTitleLable: UILabel!
    
    @IBOutlet weak var bottomView: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var numbelLabel: UILabel!
    
    
    func settingForViewGradientLayer(){
        
        let bottomLayer:CAGradientLayer = CAGradientLayer()
        bottomLayer.frame = bottomView.bounds
        let color0 = UIColor(red:0, green:0, blue:0 , alpha:1).cgColor
        let color1 = UIColor(red:0, green:0, blue:0 , alpha: 0.1).cgColor
        bottomLayer.colors = [color1,color0]
        bottomLayer.locations = [0,1]
        bottomLayer.startPoint = CGPoint(x:0,y:0)
        bottomLayer.endPoint = CGPoint(x:0, y:1)
        bottomView.layer.insertSublayer(bottomLayer, at: 0)
        
        
        
        let topLayer:CAGradientLayer = CAGradientLayer()
        topLayer.frame = topView.bounds
        let color2 = UIColor(red:0, green:0, blue:0 , alpha:1).cgColor
        let color3 = UIColor(red:0, green:0, blue:0 , alpha: 0.1).cgColor
        topLayer.colors = [color2,color3]
        topLayer.locations = [0,1]
        topLayer.startPoint = CGPoint(x:1, y:0)
        topLayer.endPoint = CGPoint(x:0, y:0)
        topView.layer.insertSublayer(topLayer, at: 0)
        
        
    }
    
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()

        mainBgView.layer.cornerRadius = 5
        mainBgView.clipsToBounds = true
        mainBgView.backgroundColor = UIColor.orange
    
        settingForViewGradientLayer()
    
    
    }

}
