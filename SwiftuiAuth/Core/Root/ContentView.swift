//
//  ContentView.swift
//  SwiftuiAuth
//
//  Created by man ching chan on 25/8/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel : AuthViewModel
    
    
    var body: some View {

        
        Group{
            
            if (viewModel.userSession != nil){
 
                ProfileView()
                
            } else{
                
                LoginView()
            }
            
        }

            
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthViewModel())
    }
}
