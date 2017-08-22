//
//  SUN_ViewController.swift
//  douyuTVDemo
//
//  Created by 孙启双 on 2017/8/4.
//  Copyright © 2017年 孙启双. All rights reserved.
//

import UIKit

let K_Width = UIScreen.main.bounds.size.width
let K_Height = UIScreen.main.bounds.size.height

class SUN_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        if (self.navigationController?.viewControllers.count)! > 1 {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named:"_navi_back_sdk"), style: .plain, target: self, action: #selector(backBarItemClick))
        }

    
    }

    
    func backBarItemClick(){
        self.navigationController?.popViewController(animated: true)
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
