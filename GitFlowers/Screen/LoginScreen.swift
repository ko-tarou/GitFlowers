//
//  LoginScreen.swift
//  GitFlowers
//
//  Created by kota on 2025/04/15.
//
import SwiftUI

struct LoginScreen: View {
    var body: some View {
        ButtonGitHub()
    }
}


// github連携ボタン
struct ButtonGitHub: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var username: String = ""
    
    var body: some View {
        Button(action: {
            // 取得
            viewModel.login(username: "mitsui6969")
        }){
            HStack{
                Image("GitHubIcon")
                    .resizable()
                    .scaledToFit()
                    .padding(.vertical)
                Text("GitHub連携")
            }
            .foregroundStyle(Color.white)
            .frame(width: 300, height: 60)
            .background(Color.black)
            .cornerRadius(50)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.black, lineWidth: 1)
            )
        }
    }
}


#Preview {
    LoginScreen()
}
