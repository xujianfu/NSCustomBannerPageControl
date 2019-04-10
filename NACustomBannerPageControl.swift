//
//  NACustomBannerPageControl.swift
//  10000114CarProject
//
//  Created by 张晓滨 on 2019/4/3.
//  Copyright © 2019年 一万一一四. All rights reserved.
//
import UIKit

class NACustomBannerPageControl: UIView {
    let pageControlDiameter: Float = 5
    var currentPage: NSInteger = 0 {
        didSet {
            if oldValue == currentPage {
                return
            }
            
            if currentPage < oldValue {// 向右拉伸
                UIView.animate(withDuration: 0.3, animations: {
                    for dot in self.subviews {
                        var dotFrame = dot.frame
                        if dot.tag == self.currentPage {
                            dotFrame.size.width = CGFloat(self.pageControlDiameter * 2.0)
                            dot.backgroundColor = colorWithHexString("0xfdd000")
                            dot.frame = dotFrame
                            
                        } else if dot.tag <= oldValue && dot.tag > self.currentPage {
                            dotFrame.origin.x += CGFloat(self.pageControlDiameter)
                            dotFrame.size.width = CGFloat(self.pageControlDiameter)
                            dot.backgroundColor = .white
                            dot.frame = dotFrame
                        }
                    }
                })
                
            } else {
                UIView.animate(withDuration: 0.3, animations: {
                    for dot in self.subviews {
                        var dotFrame = dot.frame
                        if dot.tag == self.currentPage {
                            dotFrame.size.width = CGFloat(self.pageControlDiameter * 2.0)
                            dotFrame.origin.x -= CGFloat(self.pageControlDiameter)
                            dot.backgroundColor = colorWithHexString("0xfdd000")
                            dot.frame = dotFrame
                            
                        } else if dot.tag > oldValue && dot.tag < self.currentPage {
                            dotFrame.origin.x -= CGFloat(self.pageControlDiameter)
                            dot.frame = dotFrame
                            
                        } else if dot.tag == oldValue {
                            dotFrame.size.width = CGFloat(self.pageControlDiameter)
                            dot.backgroundColor = .white
                            dot.frame = dotFrame
                        }
                    }
                })
                
            }
            
        }
    }
    var numberOfPages: NSInteger = 0 {
        didSet {
            if self.numberOfPages == 0 {
                return
            }
            if self.subviews.count > 0 {
                for view in self.subviews {
                    view.removeFromSuperview()
                }
            }

            var dotX: Float = 0;
            var dotW: Float = pageControlDiameter;
            var bgColor: UIColor
            for i in 0..<numberOfPages {
                if i <= currentPage {
                    dotX = pageControlDiameter * 2.0 * Float(i)
                } else {
                    dotX = pageControlDiameter * 2 * Float(i) + pageControlDiameter
                }
                
                if i == currentPage {
                    dotW = pageControlDiameter * 2;
                    bgColor = colorWithHexString("0xfdd000")
                } else {
                    dotW = pageControlDiameter;
                    bgColor = .white
                }

                let temp = UIView()
                temp.frame = CGRect(x: CGFloat(dotX), y: CGFloat(0), width: CGFloat(dotW), height: CGFloat(pageControlDiameter))
                temp.layer.cornerRadius = CGFloat(pageControlDiameter * 0.5)
                temp.layer.masksToBounds = true
                temp.backgroundColor = bgColor
                temp.tag = i
                addSubview(temp)
            }

        }
    }
    
}
