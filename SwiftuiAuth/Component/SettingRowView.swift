//
//  SettingRowView.swift
//  SwiftuiAuth
//
//  Created by man ching chan on 25/8/2023.
//

import SwiftUI

struct SettingRowView: View {
    
    let imageName : String
    let title : String
    let tintColor : Color
    
    
    
    var body: some View {
        HStack(spacing:12){
            
            Image(systemName: imageName)
                .imageScale(.small)
                .foregroundColor(tintColor)
                .font(.title)
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
            
        }
    }
}

struct SettingRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingRowView(imageName: "gear", title: "Version", tintColor: Color(.systemGray))
    }
}
