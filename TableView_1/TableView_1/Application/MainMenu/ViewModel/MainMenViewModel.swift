//
//  MainMenViewModel.swift
//  TableView_1
//
//  Created by Bizplay on 2022/12/19.
//

import Foundation
class MainMenuViewModel {
    
    var cells : [MainMenuModel<Any>] = []
    
    func intitValueCellData() {
        
        cells = []
        
        cells.append(MainMenuModel<Any>(value: MenuInfo(title: "1. TableView with Array Data", rowType: .ArrayModeWithTableView)))
        
        cells.append(MainMenuModel<Any>(value: MenuInfo(title: "2. Add, Delete && Update TableView", rowType: .AddDeleteUpdateRow)))
        
        cells.append(MainMenuModel<Any>(value: MenuInfo(title: "3. Loading Data Animations", rowType: .LoadDataAnimation)))
        
        cells.append(MainMenuModel<Any>(value: MenuInfo(title: "4. CollectionView Inside TableView", rowType: .CollectionInSideTableView)))
        
        cells.append(MainMenuModel<Any>(value: MenuInfo(title: "5. Header and Footer of TableView", rowType: .HeaderAndFooter)))
        
        cells.append(MainMenuModel<Any>(value: MenuInfo(title: "6. Reusable Cell Xib File", rowType: .ReusableXibFile)))
        
        cells.append(MainMenuModel<Any>(value: MenuInfo(title: "7. Pagination with TabeleView", rowType: .Pagination)))
        
        cells.append(MainMenuModel<Any>(value: MenuInfo(title: "8. TableView Cell", rowType: .TableViewCell)))
        
    }
    
}
