//
//  ViewController.swift
//  Chapter17-4
//
//  Created by daito yamashita on 2021/03/24.
//

import UIKit

class ViewController: UIViewController {

    func drawLine() -> UIImage {
        let a = CGPoint(x: 50, y: 70)
        let b = CGPoint(x: 250, y: 100)
        let c = CGPoint(x: 120, y: 200)
        let d = CGPoint(x: 50, y: 300)
        let e = CGPoint(x: 250, y: 300)
        let f = CGPoint(x: 250, y: 500)
        let g = CGPoint(x: 100, y: 550)
        
        // イメージ処理の開始
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        
        // 塗りつぶし色
        UIColor.lightGray.setFill()
        
        // 補助線を引く
        UIColor.black.setStroke()
        let linePath = UIBezierPath()
        
        // 直線のパスを追加していく
        linePath.append(makeLinePath(a, b))
        linePath.append(makeLinePath(b, c))
        linePath.append(makeLinePath(d, e))
        linePath.append(makeLinePath(f, g))
        linePath.lineWidth = 1.0
        
        // 点線で描く
        linePath.setLineDash([2.0, 2.0], count: 2, phase: 0.0)
        linePath.stroke()
        
        // ベジェ曲線１を描く
        UIColor.red.setStroke()
        let curvePath1 = UIBezierPath()
        
        // 始点へ移動
        curvePath1.move(to: a)
        
        // コントロールポイントが１つのベジェ曲線
        curvePath1.addQuadCurve(to: c, controlPoint: b)
        curvePath1.lineWidth = 2
        curvePath1.fill()
        curvePath1.stroke()
        
        // ベジェ曲線２を描く
        UIColor.blue.setStroke()
        let curvePath2 = UIBezierPath()
        
        // 始点へ移動
        curvePath2.move(to: d)
        
        // コントロールポイントが２つのベジェ曲線
        curvePath2.addCurve(to: f, controlPoint1: e, controlPoint2: g)
        curvePath2.lineWidth = 2
        curvePath2.fill()
        curvePath2.stroke()
        
        // イメージコンテキストからUIImageを作る
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        // イメージ処理の終了
        UIGraphicsEndImageContext()
        return image!
    }
    
    func makeLinePath(_ startPoint: CGPoint, _ endPoint: CGPoint) -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        return path
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let drawImage = drawLine()
        
        let drawView = UIImageView(image: drawImage)
        
        view.addSubview(drawView)
    }


}

