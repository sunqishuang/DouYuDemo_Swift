//
//  NormalVC_Home.swift
//  douyuTVDemo
//
//  Created by 孙启双 on 2017/8/4.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit


fileprivate let kMenuViewH : CGFloat = 200

class NormalVC_Home: SUN_ViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {


    fileprivate lazy var menuView : AmuseMenuView = {
        let menuView = AmuseMenuView.amuseMenuView()
        menuView.frame = CGRect(x: 0, y: -kMenuViewH, width: K_Width, height: kMenuViewH)
        
        return menuView
    }()

    
    var collectionView:UICollectionView?
    

    
    open var identification:String?
    var dataArray:[NormalListModel]? = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configUI()
        

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        GetListWithNetwork()

    }
    
    func configUI(){
        print("\(menuView.subviews))")

        
        let flowLayout :UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        collectionView = UICollectionView.init(frame: CGRect(x:0, y:0, width:K_Width, height:K_Height - 113 - 49), collectionViewLayout: flowLayout)
        
        collectionView?.backgroundColor = .white
        collectionView?.dataSource = self
        collectionView?.delegate = self

        self.view.addSubview(collectionView!)
        
        collectionView?.register(ScrollHeaderView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "ScrollHeaderView")
        
        collectionView?.register(CollectionFooterView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "CollectionFooterView")
        
        
        collectionView?.register(UINib.init(nibName: "NormalHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "NormalHeaderView")
        
        collectionView?.register(UINib.init(nibName: "NormalItemCell", bundle: nil), forCellWithReuseIdentifier: "NormalItemCell")
        
        collectionView?.register(UINib.init(nibName: "AmuseMenuView", bundle: nil), forCellWithReuseIdentifier: "AmuseMenuView")
        

        
        collectionView?.addSubview(self.menuView)
        collectionView?.contentInset = UIEdgeInsets(top: kMenuViewH, left: 0, bottom: 0, right: 0)
        
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        

        return (dataArray?.count)!

        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
   
        let firstModel:NormalListModel = (self.dataArray?[section])!
        
        return firstModel.room_list!.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell:NormalItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NormalItemCell", for: indexPath) as! NormalItemCell
        
        let firstModel:NormalListModel = (self.dataArray?[indexPath.section])!
        
        let room :NoralRoomListModel = firstModel.room_list![indexPath.row]
        
        
        cell.mainImageView.sd_setImage(with: URL.init(string: room.room_src), completed: nil)
        
        cell.roomTitleLable.text = room.room_name
        cell.numbelLabel.text = room.online
        cell.nameLabel.text = room.nickname
      
        
        return cell
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView{
        
        
        if (kind == UICollectionElementKindSectionHeader){
            
            let header:NormalHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "NormalHeaderView", for: indexPath) as! NormalHeaderView
            
            
            let firstModel:NormalListModel = (self.dataArray?[indexPath.section])!
            
            
            header.typeImageView.sd_setImage(with: URL.init(string: (firstModel.icon_url)))
            
            header.titleLabel.text = firstModel.tag_name
            if firstModel.tag_name == "最热" {
                header.typeImageView.image = UIImage(named:"home_header_hot")
            }

            return header
        }
        
        
        
        
        
        let footer:CollectionFooterView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "CollectionFooterView", for: indexPath) as! CollectionFooterView
        
        
        footer.backgroundColor = UIColor(red:238/256.0, green:238/256.0, blue:238/256.0, alpha:1)
        
        
        return footer
        
        
        
        
        
        
        
    }
    
    
    
    func  collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        
     
            
            let width = (K_Width - 15)/2.0
            
            return CGSize(width:width, height:width * 3/4.0 + 30)
        
        
        
        
    }
    func  collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        

        
        return UIEdgeInsetsMake(0 , 5, 10, 5)
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{

        
        return 10
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{

        
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize{

        
        return CGSize(width:K_Width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize{
        
        return CGSize(width:K_Width, height:8)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

            
            let firstModel:NormalListModel = (self.dataArray?[indexPath.section - 1])!
            
            let room :NoralRoomListModel = firstModel.room_list![indexPath.row]
            
            let gameVC:GamePlayVC = GamePlayVC()
            
//            gameVC.roomModel = room
            
            self.navigationController?.pushViewController(gameVC, animated: true)
            
        
        
        
        
    }
    
    
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    
    
    }
    

    
    
    func GetListWithNetwork(){
        SUN_Network().NetworkWithGet("https://capi.douyucdn.cn/api/homeCate/getHotRoom", parmer: ["identification":self.identification!,"client_sys":"ios"]) { (respondsObject) in
            let result:NSDictionary = respondsObject as! NSDictionary
            
            let error:Int = result["error"] as! Int
            
            print("....https://capi.douyucdn.cn/api/homeCate/getHotRoom?identification=\(self.identification!)&client_sys=ios")
            
            if error == 0 {
                
                let data:NSArray = result["data"] as! NSArray
                
                self.dataArray = NormalListModel.mj_objectArray(withKeyValuesArray: data) as? [NormalListModel]
                self.menuView.groups = Array(self.dataArray![1...(self.dataArray!.count - 1)])
                
                self.collectionView?.reloadData()
            }
        }
    }
    
    
    
    
    
    

}
