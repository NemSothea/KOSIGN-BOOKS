//
//  RegisterView.swift
//  SwiftUI-and-Combine
//
//  Created by NEMSOTHEA on 2023/10/07.
//

import SwiftUI

struct RegisterView: View {
    
    //MARK: - State
    @State var name      : String = ""
    @State var email     : String = ""
    @State var password  : String = ""
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start Organize to do", degree: -15,background: .orange)
            
        }
        
        Form {
            TextField("Full Name ", text: $name)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
            
            TextField("Email Address", text: $email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocorrectionDisabled()
                .autocapitalization(.none)
            
            SecureField("Password", text: $password)
                .textFieldStyle(DefaultTextFieldStyle())
            
            //Button
            TLButton(title: "Create Account", color: .green) {
                //action here
                
            }
            .padding()
        }
        .offset(y:-50)
        
        Spacer()
    }
}

#Preview {
    RegisterView()
}
