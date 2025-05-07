//
//  BookMarkTapCoordinator.swift
//  CoordinatorApp
//
//  Created by Bizplay on 2023/02/10.
//
import UIKit
import WidgetKit
import SwiftUI

class BookTabVC : UIViewController, StoryBoarded {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var myTableView : UITableView!
    
    //MARK: - Properties
    private var questionsViewModel = QuestionViewModel()
    
    var indexPath : IndexPath?
  
    //MARK: - ViewLifeCycle
    override func viewDidLoad() {
         super.viewDidLoad()
        
        
        
        self.questionsViewModel.initReadingData()
        
        let bookView = MenuView()
//
//        // Embed the SwiftUI view in a UIHostingController
        let hostingController = UIHostingController(rootView: bookView)
        hostingController.modalPresentationStyle = .fullScreen
        
        // Present the UIHostingController
        self.present(hostingController, animated: true, completion: nil)
        
        
    
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
      
        
        
    }


}

