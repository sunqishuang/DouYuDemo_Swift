//
//  SUN_NavigationController.swift
//  douyuTVDemo
//
//  Created by 孙启双 on 2017/8/4.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit

class SUN_NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
       
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
