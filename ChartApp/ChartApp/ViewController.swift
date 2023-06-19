//
//  ViewController.swift
//  ChartApp
//
//  Created by Bizplay on 2023/06/16.
//

import UIKit
import DGCharts

class ViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var chartView : PieChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        /*
        // Data for the donut chart
          let data: [(value: Double, color: UIColor)] = [
              (value: 50.0, color: UIColor.gray),
              (value: 50.0, color: UIColor.brown)
          ]

          // Create a donut chart view
          let donutChartView = DonutChartView(frame: CGRect(x: 100, y: 100, width: 200, height: 200), data: data)

          // Add the donut chart view to the main view
         This is for LOCAL
          self.view.addSubview(donutChartView)
        */
  
        chartView.delegate = self
        chartView.holeRadiusPercent = 0.5
        chartView.transparentCircleRadiusPercent = 0.0
        chartView.drawCenterTextEnabled = true
        chartView.centerText = "Pie Chart"
        // Set up data entries
                let entry1 = PieChartDataEntry(value: 40.0, label: "Red")
                let entry2 = PieChartDataEntry(value: 30.0, label: "Blue")
                let entry3 = PieChartDataEntry(value: 30.0, label: "Yellow")
                let entries = [entry1, entry2,entry3]
                
                // Create and customize the data set
                let dataSet = PieChartDataSet(entries: entries, label: "")
                dataSet.colors = [UIColor.red, UIColor.blue, UIColor.yellow]
                dataSet.selectionShift = 10.0 // Adjust the selection shift
                
                // Create the data object with the data set
                let data = PieChartData(dataSet: dataSet)
                
                // Set the data for the chart view
                chartView.data = data
            
        
    }


}

