//
//  ProfileView.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import SwiftUI

struct ProfileView: View {
    
    //MARK: - StateObject from Published
    @StateObject var profileViewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Profile")
            }
            .navigationTitle("Profile")
        }
    }
}

//#Preview {
//    ProfileView()
//}
