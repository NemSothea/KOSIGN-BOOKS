//
//  LoginView.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import SwiftUI

struct LoginView: View {
    //MARK: - State
    @State var email    = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                //Create Header
                HeaderView(title: "To Do List", subtitle: "Get things done", degree: 15, background: .pink)
                
                //Login Form
                Form {
                    TextField("Email Address", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SecureField("Password",text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Button {
                        //login click
                        
                    } label: {
                        //Button style
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                            
                            Text("Log In")
                                .foregroundColor(.white)
                                .bold()
                        }
                       
                    }
                    .padding()
                }
                
                // Register account
                VStack {
                    Text("New around here?")
                    
                    //Link this navigation to Register view
                    NavigationLink("Register and account", destination: RegisterView())
                    
                }
                .padding(.bottom,50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
