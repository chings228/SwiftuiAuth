//
//  LoginView.swift
//  SwiftuiAuth
//
//  Created by man ching chan on 25/8/2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        NavigationStack {
            VStack{
                
                // image
                
                Image("firebase")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120)
                    .padding(.vertical,32)
                
                // form field
                
                VStack(spacing:24){
                    
                    InputView(text: $email, title: "Email Address", placeholder: "name@example",isSecureField: false)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password here",isSecureField: true)
                    
                }
                .padding(.horizontal)
                .padding(.top,12)
                
                
                // sign in button
                
                Button{
                   
                    
                } label:{
                    HStack{
                        
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width:UIScreen.main.bounds.width - 32,height:48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top,24)
                
                
                Spacer()
                
                // sign up button
                
                NavigationLink{
                    
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                   
                    
                } label:{
                    
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size:14))
                }
                
                
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
