//
//  SUN_Network.swift
//  douyuTVDemo
//
//  Created by 孙启双 on 2017/8/7.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit
import AFNetworking

class SUN_Network: NSObject {

    
    
    func manager() ->AFHTTPSessionManager{
        let manager :AFHTTPSessionManager = AFHTTPSessionManager.init(baseURL: nil)

        
        manager.responseSerializer.acceptableContentTypes =  NSSet.init(objects: "application/json", "text/json", "text/javascript","text/html") as! Set<String>
        
        return manager
        
    }
    

    
    func NetworkWithPost(_ api:String, parmer:NSMutableDictionary?,completion: ((Any?) -> Swift.Void)?) ->() {
    
        
        
        manager().post(api, parameters: parmer, progress: nil, success: { (task, respondsObject) in
            if completion != nil{
                completion!(respondsObject!)
            }
        } , failure:{ (task, error) in
           
            print("请求出错了, \(error.localizedDescription)")
        })
        
        
        
        
        
        
    }
    
     func NetworkWithGet(_ api:String, parmer:NSMutableDictionary?,completion: ((Any?) -> Swift.Void)?) ->() {
    
        manager().get(api, parameters: parmer, progress: nil, success: { (task, respondsObject) in
           
            print("\(task).....\(String(describing: respondsObject))")
            
            if completion != nil{
                completion!(respondsObject!)
            }
        }, failure: { (task, error) in
            print("请求出错了, \(error.localizedDescription)")

        })
        
        
    }
    
    
    
    
}
