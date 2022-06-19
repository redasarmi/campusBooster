//
//  Login.swift
//  campusBooster
//
//  Created by Reda Sarmi on 19/06/2022.
//

import Foundation
import SwiftUI

struct LoginView : View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            WelcomeText()
            LogoImage()
            TextField("email:", text: $username)
                .padding()
                .background(Color.gray)
                .cornerRadius(5.0)
                .padding(.bottom, 10)
            SecureField("Password:", text: $password)
                .padding()
                .background(Color.gray)
                .cornerRadius(5.0)
                .padding(.bottom, 10)
            Button(action: {print("button tapped")}) {
                LoginButton()
            }
        }
        .padding()
    }
}

struct WelcomeText: View {
    var body: some View {
        Text("Welcome to Campus Booster")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
            .multilineTextAlignment(.center)
    }
}

struct LogoImage: View {
    var body: some View {
        Image("logo-supinfo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
    }
}

struct Previews_LoginView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LoginView()
        }
    }
}

struct LoginButton: View {
    var body: some View {
        Text("LOGIN")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 120, height: 40)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}
