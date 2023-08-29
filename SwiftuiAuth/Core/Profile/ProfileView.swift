//
//  ProfileView.swift
//  SwiftuiAuth
//
//  Created by man ching chan on 25/8/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel : AuthViewModel
    
    var body: some View {
        
  
        if let user = viewModel.currentUser  {
            List{
                Section{
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .foregroundColor(.white)
                            .frame(width:77,height:72)
                            .background(Color(.systemGray))
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading,spacing: 4){
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top,4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            
                            
                        }
                        
                    }
                    
                    
                    
                    
                }
                
                Section("General"){
                    
                    HStack{
                        
                        SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
                        Spacer()
                        
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                }
                
                Section("Account"){
                    
                    Button{
                        viewModel.signOut()
                        
                    }
                label:{
                    SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: Color(.systemGray))
                }

 
                    Button{
                        
                    }label: {
                        SettingRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color(.systemGray))
                    }
                        
                        
                

                    
                    
                }
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
