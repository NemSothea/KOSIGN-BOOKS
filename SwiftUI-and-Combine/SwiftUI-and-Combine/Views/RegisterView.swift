//
//  RegisterView.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import SwiftUI

struct RegisterView: View {
    
    //MARK: - StateObject from Published
    @StateObject var registerVM = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start Organize to do", degree: -15,background: .orange)
            
        }
       
        Form {
            if !registerVM.messageError.isEmpty {
                Text(registerVM.messageError)
                    .foregroundColor(Color.red)
                    .font(.caption)
                    .offset(y:-10)
            }
            TextField("Full Name ", text: $registerVM.name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            
            TextField("Email Address", text: $registerVM.email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
                .autocapitalization(.none)
            
            SecureField("Password", text: $registerVM.password)
                .textFieldStyle(DefaultTextFieldStyle())
            
            //Button
            TLButton(title: "Create Account", color: .green) {
                //action here
                self.registerVM.register()
            }
            .padding()
        }
        .offset(y:-50)
        
        Spacer()
    }
}

//#Preview {
//    RegisterView()
//}
