//
//  RegistrationView.swift
//  SwiftuiAuth
//
//  Created by man ching chan on 25/8/2023.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var fullname = ""
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var viewModel : AuthViewModel

    
    
    var body: some View {
        VStack{
            
            
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
                
                InputView(text: $fullname, title: "Full name", placeholder: "Enter your name",isSecureField: false)
                    .disableAutocorrection(true)
                
                InputView(text: $password, title: "Password", placeholder: "Enter your password here",isSecureField: true)
                
                InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password",isSecureField: true)
                
                
                
                
            }
            .padding(.horizontal)
            .padding(.top,12)
            
            
            // sign up button
            
            Button{
                print("");
                
                Task{
                    try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                }
                
            } label:{
                HStack{
                    
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundColor(.white)
                .frame(width:UIScreen.main.bounds.width - 32,height:48)
            }
            .background(Color(.systemBlue))
            .cornerRadius(10)
            .padding(.top,24)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            
            
            
            Spacer()
            
            Button{
                
                dismiss()
               
                
            } label:{
                
                HStack(spacing: 3){
                    Text("Already have an account")
                    Text("Sign In")
                        .fontWeight(.bold)
                }
                .font(.system(size:14))
                .foregroundColor(.blue)
            }
            
            
        }
    }
}



extension RegistrationView : AuthenticationFormProtocol{
    
    var formIsValid: Bool{
        
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && !fullname.isEmpty
        && confirmPassword == password
        
    }
    
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
