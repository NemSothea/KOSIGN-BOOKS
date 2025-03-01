//
//  BookMarkTapCoordinator.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/10.
//
import UIKit
import WidgetKit
import SwiftUI

class BookMarkTabVC : UIViewController, StoryBoarded {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var myTableView : UITableView!
    
    //MARK: - Properties
    private var questionsViewModel = QuestionViewModel()
    
    var indexPath : IndexPath?
  
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
         super.viewDidLoad()
        self.questionsViewModel.initReadingData()
        
        self.sendReadingDataToWidget()
    
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
      
        
        self.animateTable()
        
    }
#warning("Will delete this function")
    private func readingData() {
        
    
        
        let userDefaults = UserDefaults.appGroupIdentifier
        
        if let data = userDefaults?.data(forKey: "ReadingWidgetData") {
            
            do {
          
                
                let decoder = JSONDecoder()
                let readingData = try decoder.decode([ReadingWidgetModel].self, from: data)
               
                print("Decoded Data: \(readingData)") // For basic inspection

                // ... continue to step 2 to format it nicely
            } catch {
                print("Error decoding data: \(error)")
            }
        }
    }
    private func mapToReadingModel() -> [ReadingWidgetModel] {
        
        var readingData = [ReadingWidgetModel]()
        
        self.questionsViewModel.TOPIKQuestionArray.forEach { value in
            readingData.append(contentsOf: [ReadingWidgetModel(topikID: value.caseRawValue, topikName: value.titleReading)])
        }
        
        return readingData
    }
    private func sendReadingDataToWidget() {
        
        let readingData = mapToReadingModel()

        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(readingData)
            let userDefaults = UserDefaults.appGroupIdentifier
            userDefaults?.set(data, forKey: "ReadingWidgetData")
            
//            self.readingData()
        
            // Notify the widget to reload if needed
            DispatchQueue.main.async {
                WidgetCenter.shared.reloadTimelines(ofKind: WidgetType.reading.rawValue)
            }
        } catch {
            print("Failed to encode objects: \(error)")
            
        }
    }
    
    private func animateTable() {
        self.myTableView.reloadData()
        
        let cells = myTableView.visibleCells
        let tableHeight: CGFloat = myTableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = .identity
            }, completion: nil)
            index += 1
        }
    }

}
//MARK: - Extension TableView
extension BookMarkTabVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseOut, animations: {
            cell?.transform = CGAffineTransform.identity.scaledBy(x: 0.97, y: 0.97)
        }) { (_) in
              /// ************** do action here **************
        }
    }
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseOut, animations: {
            cell?.transform = CGAffineTransform.identity.scaledBy(x: 1.01, y: 1.01)
        }) { (_) in
            UIView.animate(withDuration: 0.2, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                cell?.transform = CGAffineTransform.identity
            }) { (_) in
                
                /// ************** do action here **************
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questionsViewModel.TOPIKQuestionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! BookMarkTabTableViewCell
        let questionNumber = self.questionsViewModel.TOPIKQuestionArray[indexPath.row]
        
        let fontSize = Share.shared.setFontSize()
        
        cell.title.font = UIFont(name: "1HoonDdukbokki Regular", size: fontSize)
        
         // Get the corresponding ReadingQuestion enum case
        if let question = QuestionType(rawValue: questionNumber.rawValue) {
            // Use the title in the cell
            cell.title.text = question.titleReading
        } else {
            cell.title.text = "Invalid Question"
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ReadingQuestionVC") as? ReadingQuestionVC else { return }
//        vc.modalPresentationStyle = .fullScreen
//        vc.indexTopic        = self.questionsViewModel.TOPIKQuestionArray[indexPath.row].rawValue
//        self.present(vc, animated: true)
        
        let selectedTopic = questionsViewModel.TOPIKQuestionArray[indexPath.row].rawValue
        
        // Create an instance of your SwiftUI view
        let readingQuestionView = ReadingQuestionView(indexTopic: selectedTopic)
        
        // Embed the SwiftUI view in a UIHostingController
        let hostingController = UIHostingController(rootView: readingQuestionView)
        hostingController.modalPresentationStyle = .fullScreen
        
        // Present the UIHostingController
        self.present(hostingController, animated: true, completion: nil)
    }

}
