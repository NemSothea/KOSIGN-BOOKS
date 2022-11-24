//
//  Share.swift
//  Constraints-Webview_1
//
//  Created by Bizplay on 2022/11/24.
//

import Foundation

struct BIZ_POINT : Encodable {
    
    var PTL_ID      : String?
    var CHNL_ID     : String?
    var USE_INTT_ID : String?
    var USER_ID     : String?
    var USER_NM     : String?
    var PTL_URL     : String?
}


struct Share  {
    static func callBizPoint() -> BIZ_POINT {
        
        return BIZ_POINT(PTL_ID: "PTL_51",CHNL_ID:"CHNL_1",USE_INTT_ID: "UTLZ_1709060902735",USER_ID:"simdemo01t",USER_NM:"심관리자s",PTL_URL: "https://mg-dev.bizplay.co.kr/")
    }
}
