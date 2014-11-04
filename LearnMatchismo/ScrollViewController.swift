//
//  ScrollViewController.swift
//  LearnMatchismo
//
//  Created by zhengxiao on 11/4/14.
//  Copyright (c) 2014 zhengxiao. All rights reserved.
//

import Foundation
import UIKit

class ScrollViewController: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Trying Swift TableView"
        
        if let scrollViewValue = scrollView{
            let subImageView = UIImageView(image: UIImage(named: "avatar"))
            scrollViewValue.addSubview(subImageView)
            subImageView.frame = CGRectMake(2700, 100, 121, 180)
            scrollViewValue.contentSize = CGSizeMake(3000, 2000)
            scrollViewValue.delegate = self;
        }
        
    
    }

    @IBAction func didClickButton(sender: AnyObject) {
        scrollView!.setContentOffset(CGPointMake(2700, 100), animated: true)
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView){
        if let textViewValue = textView {
            textViewValue.text = NSString(format:"(%@, %@)",scrollView.contentOffset.x,scrollView.contentOffset.y);
        }
    }
}