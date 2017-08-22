//
//  RecommandFirstModel.swift
//  douyuTVDemo
//
//  Created by 孙启双 on 2017/8/7.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit
import MJExtension

class RecommandFirstModel: NSObject {

    var cateInfo:cateInfoModel?
    var list:[listModel]?
    
    
    
   override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return ["list" : "listModel"];

    }
    
    
    
    override func mj_keyValuesDidFinishConvertingToObject(){
       
        self.list = listModel.mj_objectArray(withKeyValuesArray: self.list).copy() as? [listModel]
        
    }
    

}


class cateInfoModel: NSObject {
 
    var level = ""
    var cid2 = ""
    var cate2_name = ""
    var cate1_name = ""
    var is_vertical = ""
    var push_nearby = ""
    var icon_url = ""

}

class listModel: NSObject {
 
    var room_id = ""
    var room_name = ""
    var nickname = ""
    var is_vertical = ""
    var room_src = ""
    var vertical_src = ""
    var online_num = ""
    var iho = ""
    var anchor_city = ""

    
}
