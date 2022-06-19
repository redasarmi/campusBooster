//
//  SettingsView.swift
//  campusBooster
//
//  Created by Reda Sarmi on 01/06/2022.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @ObservedObject var datas = ReadDataProfile()
    
    var body: some View {
        NavigationView {
            List(datas.profiles){ profile in
                
                VStack(alignment: .leading) {
                    
                    Text(profile.first_name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.gray)
                    
                    HStack{
                        Text("year in cursus \(profile.year_in_cursus)")
                            .font(.title3)
                            .foregroundColor(Color.red)
                        
                        Spacer()
                        Text(profile.email)
                            .font(.title3)
                    }
                }
            }
            .navigationTitle("Profile")
        }
    }
}
