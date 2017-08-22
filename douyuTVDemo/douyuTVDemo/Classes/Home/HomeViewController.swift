//
//  HomeViewController.swift
//  douyuTVDemo
//
//  Created by 孙启双 on 2017/8/4.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit

import VTMagic

class HomeViewController: SUN_ViewController,VTMagicViewDataSource,VTMagicViewDelegate {

    
    let magicVC:VTMagicController = VTMagicController()
    
    var titleArray : [String]? = ["推荐"]
    
    var cateList : [CateListModel]?{
        didSet{

            for var catemodel  in cateList! {
                titleArray?.append(catemodel.title)
            }
            self.magicVC.magicView.reloadData()
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configMagicVC()
        self.addChildViewController(magicVC)
        self.view.addSubview(self.magicVC.view)
        self.magicVC.didMove(toParentViewController: self)
        self.magicVC.magicView.reloadData()
        

        getCateListWithNetwork()

    
    }
    
    
    func configMagicVC(){
        magicVC.magicView.frame = CGRect(x:0, y:64, width:K_Width, height:K_Height - 64)
        magicVC.magicView.dataSource = self
        magicVC.magicView.delegate = self
        magicVC.magicView.isScrollEnabled = true
        
        magicVC.magicView.sliderColor = .orange
        magicVC.magicView.sliderHeight = 1.0
        magicVC.magicView.sliderWidth = 80.0
        magicVC.magicView.layoutStyle = .divide
        magicVC.magicView.switchStyle = .default
        
        
    }
    
    //VTMagicDelegate
    func menuTitles(for magicView: VTMagicView) -> [String] {
        return titleArray!
    }
    
    func magicView(_ magicView: VTMagicView, menuItemAt itemIndex: UInt) -> UIButton {
        
        let identifier = "itemIdentifier"
        var menuItem:UIButton? = magicView.dequeueReusableItem(withIdentifier: identifier)
        if menuItem == nil{
            menuItem = UIButton.init(type: .custom)
            menuItem?.setTitleColor(.black, for: .normal)
            menuItem?.setTitleColor(.orange, for: .selected)
            menuItem?.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        }
        
        return menuItem!
        
        
        
    }
    
    
    func magicView(_ magicView: VTMagicView, viewControllerAtPage pageIndex: UInt) -> UIViewController {
        
        if pageIndex == 0{
            let recommandIdentidier = "recommandIdentidier"
            
           var  recommandVC:RecommandVC_Home? = magicView.dequeueReusablePage(withIdentifier: recommandIdentidier) as? RecommandVC_Home
            
            if recommandVC == nil {
                recommandVC = RecommandVC_Home()
            }
            
            
            
            
            return recommandVC!
            
            
            
        }
        
        
        let normalIdentifier = "normalIdentifier"
        
        var normalVC :NormalVC_Home? = magicView.dequeueReusablePage(withIdentifier: normalIdentifier) as? NormalVC_Home
        
        if normalVC == nil {
            normalVC = NormalVC_Home()
        }
        

        
        let model:CateListModel =  (self.cateList?[NSInteger(pageIndex - 1)])!
        
        normalVC?.identification = model.identification
        return normalVC!
        
        
        
        
        
    }
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func getCateListWithNetwork(){
        SUN_Network().NetworkWithGet("https://apiv2.douyucdn.cn/Live/Homecate/getHomeCateList", parmer: ["client_sys":"ios"]) { (respondsObject) in
            
            
            let result:NSDictionary = respondsObject as! NSDictionary
            
            let error:Int = result["error"] as! Int
            
            if error == 0 {
                let data:NSArray = result["data"] as! NSArray

                self.cateList = CateListModel.mj_objectArray(withKeyValuesArray: data) as? [CateListModel]
            }
            
            
        }
    }
    
    
    

}
