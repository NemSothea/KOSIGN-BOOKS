//
//  MenuList.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2022/12/26.
//

import SwiftUI

struct MenuList: View {
    let menu = Bundle.main.decode(_type: [MenuSection].self, from:"menu.json")
    var body: some View {
        NavigationStack {
            List {
                
                    Text("Hello world")
                
            }
        }
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList()
    }
}
