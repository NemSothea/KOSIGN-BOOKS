//
//  MainViewModel.swift
//  CollectionViewSample
//
//  Created by Bizplay on 2023/09/01.
//

import Foundation
class MainViewModel {
    
    //MARK: - Properties
    private(set) var menuName   = [""]
    private(set) var menuColor  = [""]
    
    var cells : [MainModel<Any>] = []
    
    func fetchAccountInfo () {
       // accountInfo Cell
        let accountInfo = AccountInfo(
                                        profileImage    : "profile",
                                        userName        : "Mrs.Mama",
                                        userID          :"ID: 0000001",
                                        amount          : "16.0",
                                        numberHistory   : "1",
                                        balanceArrow    : "arrow.right",
                                        historyArrow    : "arrow.right"
        )
        
        
        
        //Append to Main
        self.cells.append(MainModel())
    }
    
}
