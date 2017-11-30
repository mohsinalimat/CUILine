# CUILine
Swift 实现的画线控件（支持xib）

因项目中经常用到各种分割线，索性封装了一个画线的控件。
##特性
- 支持在xib中使用
- 支持设置线的颜色
- 支持设置线的粗细
- padding属性
- 支持横线和竖线
- 支持画虚线
- 可设置虚线间隔
- 可设置虚线线段的长度

##效果预览
![image.png](http://upload-images.jianshu.io/upload_images/2630165-5d063a3b44fa71d0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


##代码如下
```swift
//
//  CUILine.swift
//  JYHealth
//
//  Created by luoyang on 2017/11/30.
//  Copyright © 2017年 JY. All rights reserved.
//

import UIKit

@IBDesignable
class CUILine: UIView {
    // line
    @IBInspectable var lineWidth: CGFloat = 1
    @IBInspectable var lineColor: UIColor = UIColor.black
    // padding
    @IBInspectable var paddingLeft: CGFloat = 0
    @IBInspectable var paddingRight: CGFloat = 0
    @IBInspectable var paddingTop: CGFloat = 0
    @IBInspectable var paddingBottom: CGFloat = 0
    // direct
    @IBInspectable var isHorizontal: Bool = true
    // dash
    @IBInspectable var isDash: Bool = false
    @IBInspectable var dashPointWidth: CGFloat = 3.0
    @IBInspectable var dashSpace: CGFloat = 1.0

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // Drawing code
        // 获取上下文对象
        let context = UIGraphicsGetCurrentContext()
        
        var bx: CGFloat = 0, by: CGFloat = 0, ex: CGFloat = 0, ey: CGFloat = 0;
        if isHorizontal {
            bx = paddingLeft
            by = CGFloat(Int(rect.size.height)/2)
            ex = rect.size.width - paddingRight
            ey = by
        } else {
            bx = CGFloat(Int(rect.size.width)/2)
            by = paddingTop
            ex = bx
            ey = rect.size.height - paddingBottom
        }
        // 画中间虚线
        let path    = CGMutablePath()
        let begin   = CGPoint(x: bx, y: by),
            end     = CGPoint(x: ex, y: ey)
        path.move(to: begin)
        path.addLine(to: end)
        // 2、 添加路径到图形上下文
        context!.addPath(path)
        // 3、 设置状态
        context!.setLineWidth(lineWidth / UIScreen.main.scale)
        context!.setStrokeColor(lineColor.cgColor)
        if isDash {
            context!.setLineDash(phase: 0, lengths: [dashPointWidth, dashSpace])
        }
        // 4、 绘制图像到指定图形上下文
        context!.drawPath(using: .fillStroke)
    }

}
```

##xib中用法
**step1**： 拖一个UIView到界面上
**step2**： 如下图设置该UIView的class为CUILine
![image.png](http://upload-images.jianshu.io/upload_images/2630165-ddcc399389491cab.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
**step3**： Attributes inspector可设置线的各种属性参数，如下图
![image.png](http://upload-images.jianshu.io/upload_images/2630165-bc2b799d304c275f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
