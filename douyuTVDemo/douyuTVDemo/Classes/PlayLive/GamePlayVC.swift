//
//  GamePlayVC.swift
//  douyuTVDemo
//
//  Created by 孙启双 on 2017/8/8.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit

import IJKMediaFramework

class GamePlayVC: SUN_ViewController {
    
  
    open var roomModel:listModel?
    
    var address_url:String? {
        didSet{
            self.configPlayer()
        }
    }
    
    var player:IJKMediaPlayback?
    
    

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.GetPlayAddressWithNetwork()

    }

    
    func configPlayer(){
        
        let options:IJKFFOptions = IJKFFOptions.byDefault()
        
        
        print("url ==== \(String(describing: address_url))")
        
        self.player = IJKFFMoviePlayerController.init(contentURL: URL.init(string: address_url!), with: options)
        self.player?.view.frame = view.bounds
        self.player?.shouldAutoplay = true
        self.view.addSubview(self.player!.view)
        
        self.installMovieNotificationObservers()
        self.player?.prepareToPlay()
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.player?.shutdown()
        self.removeMovieNotificationObservers()
    }
    
    
    
    func installMovieNotificationObservers(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadStateDidChange(_:)), name: NSNotification.Name.IJKMPMoviePlayerLoadStateDidChange, object: self.player)
        
        NotificationCenter.default.addObserver(self, selector: #selector(moviePlayBackDidFinish(_:)), name: NSNotification.Name.IJKMPMoviePlayerPlaybackDidFinish, object: self.player)
        
        NotificationCenter.default.addObserver(self, selector: #selector(mediaIsPreparedToPlayDidChange(_:)), name: NSNotification.Name.IJKMPMediaPlaybackIsPreparedToPlayDidChange, object: self.player)
        
        NotificationCenter.default.addObserver(self, selector: #selector(moviePlayBackStateDidChange(_:)), name: NSNotification.Name.IJKMPMoviePlayerPlaybackStateDidChange, object: self.player)
        
    }
    
    func removeMovieNotificationObservers(){
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.IJKMPMoviePlayerLoadStateDidChange, object: self.player)
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.IJKMPMoviePlayerPlaybackDidFinish, object: self.player)
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.IJKMPMediaPlaybackIsPreparedToPlayDidChange, object: self.player)
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name.IJKMPMoviePlayerPlaybackStateDidChange, object: self.player)
    }
    
    
    
    func loadStateDidChange(_ notification:Notification){
        
        let loadState:IJKMPMovieLoadState = (self.player?.loadState)!
        
      
    }
        
        
    
    
    func moviePlayBackDidFinish(_ notification:Notification){
        
    }
    
    func mediaIsPreparedToPlayDidChange(_ notification:Notification){
        
    }
    
    func moviePlayBackStateDidChange(_ notification:Notification){
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    
    func GetPlayAddressWithNetwork(){
        
        let api:String = "https://capi.douyucdn.cn/lapi/live/appGetPlayer/stream/" + "\(roomModel!.room_id)"
        
        var rate:String = ""
        if roomModel?.is_vertical == "0" {
           rate = "0"
        }else{
            rate = "-1"
        }
        
        SUN_Network().NetworkWithGet(api, parmer: ["rate":rate,"cdn":"","client_sys":"ios","cptl":"0201","txdw":"0"]) { (respondsObject) in
            
            let result:NSDictionary = respondsObject as! NSDictionary
            
            let error:Int = result["error"] as! Int
            
            if error == 0 {
                //成功
                let data:NSDictionary = result["data"] as! NSDictionary
                
               
                
                let rmtp_url:String = data["rtmp_url"] as! String
                
                let rmtp_live:String = data["rtmp_live"] as! String
                
                //拉流地址
                self.address_url = rmtp_url + "/" + rmtp_live
                
            }
            

            
            
        }
        
    }

}
