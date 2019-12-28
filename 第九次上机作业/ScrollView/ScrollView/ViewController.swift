//
//  ViewController.swift
//  ScrollView
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...9{
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            scrollView.addSubview(imageView)
            scrollView.isPagingEnabled = true
        }
        //let imageView = UIImageView(image: UIImage(named: "1"))
        //scrollView.addSubview(imageView)
        //scrollView.contentSize = imageView.bounds.size
        scrollView.contentSize = CGSize(width: 9 * (scrollView.bounds.width), height: scrollView.bounds.height)
        //scrollView.minimumZoomScale = 0.5
        //scrollView.maximumZoomScale = 5
        scrollView.delegate = self
        pageController.numberOfPages = 9
        pageController.currentPage = 0
        pageController.isUserInteractionEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
    }
   // func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //return scrollView.subviews.first
    //}
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }

    @IBAction func pageControlClicked(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(pageController.currentPage) * scrollView.bounds.width, y: 0, width: 400, height: 550)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
}

