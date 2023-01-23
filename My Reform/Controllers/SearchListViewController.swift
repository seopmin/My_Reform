//
//  SearchListViewController.swift
//  My Reform
//
//  Created by 곽민섭 on 2023/01/23.
//

import UIKit

class SearchListViewController: UIViewController {

    public var vcTitle : String = "" {
        didSet {
            self.title = vcTitle
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
