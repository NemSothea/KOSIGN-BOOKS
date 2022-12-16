//
//  MainMenuModel.swift
//  TableView_1
//
//  Created by Bizplay on 2022/12/16.
//

import Foundation
enum ItemType : String, CaseIterable {
    
    case ArrayModeWithTableView
    case LoadDataAnimation
    case CollectionInSideTableView
    case TableViewWithSection
    case HeaderAndFooter
    case ReusableXibFile
    case Pagination
    case TableViewCell
    
}

struct MainMenuMode <T> {
    
    var value : T?
    
}
struct MenuInfo {
    var title : String
    var rowType : ItemType
}
