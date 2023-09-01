//
//  MainModel.swift
//  CollectionViewSample
//
//  Created by Bizplay on 2023/09/01.
//

struct MainModel <T> {
    var rowType : MainRowType?
    var value   : T?
}

enum MainRowType : String, CaseIterable {
    
    case AccountInfo
    
    case QuickBuyHeader
    case MakerOrderHeader
    case TopUpHeader
    
    case QuickBuy
    case MakeOrder
    case TopUp
}
///Cell Account Info
struct AccountInfo {
    
    var profileImage : String?
    var userName     : String?
    var userID       : String?
    var amount       : String?
    var numberHistory: String?
    var balanceArrow : String?
    var historyArrow : String?
    
}
///Cell Wrapper
struct Wrapper {
    
    var id      : String?
    var quality : String?
    var date    : String?
    var image   : String?
    var title   : String?
    var color   : String?
    var arrow   : String?
    
}
