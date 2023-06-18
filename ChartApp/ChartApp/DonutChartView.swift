//
//  DonutChartView.swift
//  ChartApp
//
//  Created by Bizplay on 2023/06/16.
//

import UIKit

class DonutChartView: UIView {
    private let data: [(value: Double, color: UIColor)]
    private var selectedSliceIndex: Int = -1
    init(frame: CGRect, data: [(value: Double, color: UIColor)]) {
        self.data = data
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.height / 2)
        let radius = min(rect.size.width, rect.size.height) / 2
        
        var startAngle = -CGFloat.pi / 2
        
        let totalValue = data.reduce(0) { $0 + $1.value }
        
        for (value, color) in data {
            let endAngle = startAngle + CGFloat(value / totalValue) * 2 * CGFloat.pi
            
            let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            
            path.addLine(to: center)
            path.close()
            
            color.setFill()
            path.fill()
            
            startAngle = endAngle
        }
        
        // Draw a white circle in the center to create a donut effect
        let innerRadius = radius / 2
        let innerCircleRect = CGRect(x: center.x - innerRadius, y: center.y - innerRadius, width: innerRadius * 2, height: innerRadius * 2)
        let innerPath = UIBezierPath(ovalIn: innerCircleRect)
        UIColor.white.setFill()
        innerPath.fill()
        // Add label to the top
                let labelHeight: CGFloat = 20.0
                let labelFrame = CGRect(x: 0, y: 0, width: rect.size.width, height: labelHeight)
                let labelTop = UILabel(frame: labelFrame)
        labelTop.textAlignment = .left
        labelTop.textColor = UIColor.black
        labelTop.font = UIFont.systemFont(ofSize: 14.0)
        labelTop.text = "This is a donut chart"
        // Center the label horizontally
        labelTop.center.x = center.x
                // Adjust the label position vertically
        labelTop.frame.origin.y = center.y - radius - labelHeight - 10.0
        
        // Add label to the center
                let label = UILabel(frame: innerCircleRect)
                label.textAlignment = .center
                label.textColor = UIColor.black
                label.font = UIFont.systemFont(ofSize: 16.0, weight: .bold)
                label.text = "Top4"
        self.addSubview(labelTop)
        self.addSubview(label)
    }
}
