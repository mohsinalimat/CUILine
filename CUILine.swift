//
//  CUILine.swift
//  JYHealth
//
//  Created by 骆扬 on 2017/11/30.
//  Copyright © 2017年 LY. All rights reserved.
//

import UIKit

@IBDesignable
class UILine: UIView {
    // line
    
    @IBInspectable var isLineWidthUnitUsePx: Bool = true
    @IBInspectable var lineWidth: CGFloat = 1 // 单位：point
    @IBInspectable var lineColor: UIColor = UIColor.init(red: 189/255.0, green: 189/255.0, blue: 189/255.0, alpha: 1)
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
        
        context!.setLineWidth(isLineWidthUnitUsePx ? lineWidth/UIScreen.main.scale : lineWidth)
        context!.setStrokeColor(lineColor.cgColor)
        if isDash {
            context!.setLineDash(phase: 0, lengths: [dashPointWidth, dashSpace])
        }
        // 4、 绘制图像到指定图形上下文
        context!.drawPath(using: .fillStroke)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = .clear
    }
    
}
