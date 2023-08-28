//
//  ProfileView.swift
//  SwiftuiAuth
//
//  Created by man ching chan on 25/8/2023.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        List{
            Section{
                HStack {
                    Text(User.MOCK_USER.initials)
                        .font(.title)
                        .foregroundColor(.white)
                        .frame(width:77,height:72)
                        .background(Color(.systemGray))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading,spacing: 4){
                        Text(User.MOCK_USER.fullname)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top,4)
                        
                        Text(User.MOCK_USER.email)
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
                
                HStack{
                    
                    SettingRowView(imageName: "arrow.left.circle.fill", title: "Sign out", tintColor: Color(.systemGray))
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                HStack{
                    
                    SettingRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color(.systemGray))
                    Spacer()
                    
                    Text("1.0.0")
                        .font(.subheadline)
                        .foregroundColor(.gray)
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
