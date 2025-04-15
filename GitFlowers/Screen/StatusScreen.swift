//
//  StatusScreen.swift
//  GitFlowers
//
//  Created by kota on 2025/04/15.
//
import SwiftUI

struct StatusScreen: View {
    var body: some View {
        VStack(alignment: .leading){
            UserHeaderView(icon: "hoge", name: "hoge", userID: "hogeID")
            GraphCardView()
        }
        .padding()
    }
}

// 一番上
struct UserHeaderView: View {
    let icon: String
    let name: String
    let userID: String
    
    var body: some View {
        HStack{
            Image(systemName: icon)
                .resizable()
                .frame(width: 60, height: 60)
                .background(.blue)
                .clipShape(Circle())
            
            VStack(alignment: .leading){
                Text(name)
                    .font(.title)
                Text(userID)
                    .foregroundStyle(.gray)
            }
            .padding()
        }
    }
}

// グラフ表示部分
struct GraphCardView: View {
    var body: some View {
            ZStack{
                Color.white
                Text("グラフ表示部分")
            }
            .aspectRatio(16 / 9, contentMode: .fit)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}
