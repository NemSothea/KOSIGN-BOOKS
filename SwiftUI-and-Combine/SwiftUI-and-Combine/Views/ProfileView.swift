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
                // View Builder
                if let user = profileViewModel.user {
                self.userProfile(user: user)
                }else {
                    Text("Profile is loading...")
                }
                Button {
                    //Action
                    profileViewModel.signOut()
                } label: {
                    Text("Sign Out")
                        .tint(Color.red)
                }
             Spacer()
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            profileViewModel.fetchUser()
        }
    }
    @ViewBuilder
    func userProfile(user : User) -> some View {
        //Avatar Icon
        Image(systemName: "person.circle")
            .resizable()
            .frame(width: 125,height: 125)
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
        //Info : Name , Email, Member since :
        VStack(alignment:.leading) {
            HStack {
                Text("Name :")
                    .bold()
                Text(user.name)
            }
            
            HStack {
                Text("Email :")
                    .bold()
                Text(user.email)
            }
         
            HStack {
                Text("Member since :")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated,time: .shortened))")
            }
            
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
