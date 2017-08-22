//
//  NormalListModel.swift
//  douyuTVDemo
//
//  Created by 孙启双 on 2017/8/16.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit

class NormalListModel: NSObject {

    var tag_name = ""
    var tag_id = ""

    var icon_url = ""

    var small_icon_url = ""

    var count_ios = ""

    var count = ""

    var push_vertical_screen = ""
    var push_nearby = ""
    var has_corner_icon = ""

    var room_list: [NoralRoomListModel]?
    
    
    override static func mj_objectClassInArray() -> [AnyHashable : Any]! {
        return ["room_list" : "NoralRoomListModel"];
        
    }
    
    
    
    override func mj_keyValuesDidFinishConvertingToObject(){
        
        self.room_list = NoralRoomListModel.mj_objectArray(withKeyValuesArray: self.room_list).copy() as? [NoralRoomListModel]
        
    }
    

    
}



class NoralRoomListModel: NSObject {
    var room_id = "" //房价id
    var room_src = ""
    var vertical_src = ""
    var isVertical = ""
    var cate_id = ""
    var room_name = ""
    var vod_quality = ""
    var show_status = ""
    var show_time = ""
    var owner_uid = "" //直播作者id
    var nickname = ""  //作者昵称
    var online = ""
    var game_name = ""
    var child_id = ""
    var acatar_mid = ""
    var avatar_small = ""
    var jumpUrl = ""
    
    
    
    
    
    
}

