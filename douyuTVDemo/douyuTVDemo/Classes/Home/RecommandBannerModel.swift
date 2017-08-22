//
//  RecommandBannerModel.swift
//  douyuTVDemo
//
//  Created by 孙启双 on 2017/8/7.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit

class RecommandBannerModel: NSObject {

    
    var title = ""
    var id = ""
    var pic_url = ""
    var tv_pic_url = ""
    
    var room :RoomModel?
    
}


class RoomModel: NSObject {
    var romm_id = "" //房价id
    var romm_src = ""
    var vertical_src = ""
    var isVertical = ""
    var cate_id = ""
    var romm_name = ""
    var vod_quality = ""
    var show_status = ""
    var show_time = ""
    var owner_uid = "" //直播作者id
    var nickname = ""  //作者昵称
    var owner_avatar  = ""  //作者头像地址
    var fans  = "" //粉丝数
    var owner_weight  = ""  //作者体重()
    var show_details = "" //直播间结合搜啊
    var game_icon_url = ""  //游戏icon
    var url = ""
    var game_url = ""
    var game_name = ""

    
    
}
