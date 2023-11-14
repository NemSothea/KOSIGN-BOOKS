//
//  UserView.swift
//  TestSend Data
//
//  Created by NEMSOTHEA on 11/9/23.
//

import SwiftUI

struct UserView: View {
    
    @ObservedObject var userViewModel : UserViewModel
    
    var body: some View {
        VStack {
            Text("User name: \(userViewModel.users.first?.id ?? "")")
                .minimumScaleFactor(0.5)
                .lineLimit(2)
            Text("User Count: \(userViewModel.users.count)")
        }
    }
}

//#Preview {
//    UserView(userViewModel: [User(id: "02002020200202")])
//}
