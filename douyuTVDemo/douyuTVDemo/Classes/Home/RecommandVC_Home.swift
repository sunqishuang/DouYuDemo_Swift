//
//  RecommandVC_Home.swift
//  douyuTVDemo
//
//  Created by 孙启双 on 2017/8/4.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit

import SDWebImage


class RecommandVC_Home: SUN_ViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    var collectionView:UICollectionView?
    
    var dataArray:[RecommandFirstModel]? = []
    
    var bannerList :[RecommandBannerModel]? = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configUI()
        
        getBannerDataWithNetwork()

        getFirstDataWithNetwork()
    }

    
    func configUI(){
        
        
        let flowLayout :UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        collectionView = UICollectionView.init(frame: CGRect(x:0, y:0, width:K_Width, height:K_Height - 113 - 49), collectionViewLayout: flowLayout)

        collectionView?.backgroundColor = .white
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.contentInset = UIEdgeInsetsMake(0, 0, 0, 0)
        self.view.addSubview(collectionView!)

        collectionView?.register(ScrollHeaderView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ScrollHeaderView")

        collectionView?.register(CollectionFooterView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "CollectionFooterView")
        
       
        collectionView?.register(UINib.init(nibName: "NormalHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "NormalHeaderView")
        
        collectionView?.register(UINib.init(nibName: "NormalItemCell", bundle: nil), forCellWithReuseIdentifier: "NormalItemCell")
        
        collectionView?.register(UINib.init(nibName: "HomeTopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeTopCollectionViewCell")
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return (dataArray?.count)! + 1
//        return 3

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        
//        let sectionList:NSMutableArray = dataArray![section] as! NSMutableArray
//        
//        return  sectionList.count

        
        return 4
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let cell:HomeTopCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeTopCollectionViewCell", for: indexPath) as! HomeTopCollectionViewCell
            
            if indexPath.row == 0 {
                
                cell.mainImageView!.image = UIImage(named:"homeNewItem_rankingList")
                cell.titleLabel!.text = "排行榜"
                
                
                
            }else if indexPath.row == 1{
                cell.mainImageView!.image = UIImage(named:"homeNewItem_msg")
                cell.titleLabel!.text = "消息"
            }else if indexPath.row == 2{
                cell.mainImageView!.image = UIImage(named:"homeNewItem_Activity")
                cell.titleLabel!.text = "活动"
            }else{
                cell.mainImageView!.image = UIImage(named:"homeNewItem_allLive")
                cell.titleLabel!.text = "全部直播"
            }
            
            
            
            
            return cell
        }
        
        
        let cell:NormalItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NormalItemCell", for: indexPath) as! NormalItemCell
        
        let firstModel:RecommandFirstModel = (self.dataArray?[indexPath.section - 1])!

        let room :listModel = firstModel.list![indexPath.row]
        
        
        cell.mainImageView.sd_setImage(with: URL.init(string: room.room_src), completed: nil)
        
        cell.roomTitleLable.text = room.room_name
        cell.numbelLabel.text = room.online_num
        cell.nameLabel.text = room.nickname
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        
        
        if (kind == UICollectionElementKindSectionHeader){
            
            if indexPath.section == 0{
                let header:ScrollHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ScrollHeaderView", for: indexPath) as! ScrollHeaderView
                
                
                if self.bannerList != nil {
                    header.dataList = self.bannerList!

                }
                
                return header
            }
            
            let header:NormalHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "NormalHeaderView", for: indexPath) as! NormalHeaderView
            
            
            let firstModel:RecommandFirstModel = (self.dataArray?[indexPath.section - 1])!
            
            
            header.typeImageView.sd_setImage(with: URL.init(string: (firstModel.cateInfo?.icon_url)!))
            if firstModel.cateInfo?.cate2_name == "" {
                header.titleLabel.text = firstModel.cateInfo?.cate1_name
            }else{
                header.titleLabel.text = firstModel.cateInfo?.cate2_name
            }
            
            return header
        }
        
        

        
            
            let footer:CollectionFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "CollectionFooterView", for: indexPath) as! CollectionFooterView
            

            footer.backgroundColor = UIColor(red:238/256.0, green:238/256.0, blue:238/256.0, alpha:1)
            
            
            return footer

        
        
        
        
        
        
    }
    
    
    
    func  collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        
        if (indexPath.section == 0)  {
            let width = (K_Width - 50)/5.0
            
            return CGSize(width:width, height:width + 30)
            
        }else{
            
            let width = (K_Width - 15)/2.0
            
            return CGSize(width:width, height:width * 3/4.0 + 30)
        }
       
        
        
    }
    func  collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        
        if section == 0 {
            return UIEdgeInsetsMake(10, 20, 10, 20)
        }
        
        return UIEdgeInsetsMake(0 , 5, 10, 5)
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        if (section == 0)  {
            return 0
        }
        
        return 10
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        if (section == 0)  {
            return 20
        }
        
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{
        if (section == 0)  {
            return CGSize(width: K_Width, height: K_Width * 42/108.0)
        }
        
        return CGSize(width:K_Width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize{

        return CGSize(width:K_Width, height:8)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0{
            
        }else{
            
            let firstModel:RecommandFirstModel = (self.dataArray?[indexPath.section - 1])!
            
            let room :listModel = firstModel.list![indexPath.row]
            
            let gameVC:GamePlayVC = GamePlayVC()
            
            gameVC.roomModel = room
            
            self.navigationController?.pushViewController(gameVC, animated: true)
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //网络请求
    func getBannerDataWithNetwork(){
        
        SUN_Network().NetworkWithGet("https://capi.douyucdn.cn/api/v1/slide/6", parmer: nil) { (respondsObject) in
            let result:NSDictionary = respondsObject as! NSDictionary
          
            let error:Int = result["error"] as! Int
            
            if error == 0 {
                //成功
                let data:NSArray = result["data"] as! NSArray
                
                self.bannerList = RecommandBannerModel.mj_objectArray(withKeyValuesArray: data) as? [RecommandBannerModel]
                

            }
            
            self.collectionView?.reloadData()
            
        }
        
        
        
        
        
        
        
        
    }
    
    func getFirstDataWithNetwork(){
        
        SUN_Network().NetworkWithGet("https://apiv2.douyucdn.cn/live/home/custom", parmer: NSMutableDictionary.init(object: "ios", forKey: "client_sys" as NSCopying)) { (respondsObject) in
            let result:NSDictionary = respondsObject as! NSDictionary
            
            let error:Int = result["error"] as! Int
            
            if error == 0 {
                let data:NSArray = result["data"] as! NSArray

                self.dataArray = RecommandFirstModel.mj_objectArray(withKeyValuesArray: data) as?[RecommandFirstModel]
                
                
            }
            
            self.collectionView?.reloadData()
            
        }
    }
    
    
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
