//
//  MenuList.swift
//  SwiftUIApp
//
//  Created by Bizplay on 2022/12/26.
//

import SwiftUI

struct MenuList: View {
    
     let menu = Bundle.main.decode( [MenuSection].self, from:"menu.json")!
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(header: Text(section.name).font(.custom("AmericanTypewriter", size: 20))) {
                        
                        ForEach(section.items) { item in
                            NavigationLink(value: item) {
                                ItemRow(item: item)
                            }
                        }

                    }
                }
                
            }// End List
            .navigationDestination(for: MenuItem.self, destination: { item in
                ItemDetail(item: item)
            })
            
            .navigationTitle("Menu List")
            .listStyle(GroupedListStyle())
        }//End NavigationStack
        
    }//End body
    
} //End MenuList

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList()
    }
}
