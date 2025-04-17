//
//  StatusScreen.swift
//  GitFlowers
//
//  Created by kota on 2025/04/15.
//
import SwiftUI

struct StatusScreen: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                UserHeaderView(icon: "hoge", name: "hoge", userID: "hogeID")
                GraphCardView()
                
                LinkButtonView()
                
                PinedRepositorys()
            }
            .padding()
        }
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

// ボタン達
struct LinkButton: Identifiable {
    let id = UUID() // ForEachのために必要
    var buttonIcon: String
    var buttonName: String
}

struct LinkButtonView: View {
    let linkButtons: [LinkButton] = [
            LinkButton(buttonIcon: "folder", buttonName: "リポジトリ"),
            LinkButton(buttonIcon: "star", buttonName: "Star済み"),
            LinkButton(buttonIcon: "person.3", buttonName: "Organization"),
            LinkButton(buttonIcon: "hammer", buttonName: "プロジェクト")
        ]
    
    var body: some View {
        List {
            ForEach(linkButtons){link in
                VStack{
                    Button(action: {}){
                        HStack{
                            Image(systemName: link.buttonIcon)
                                .frame(width: 30)
                            Text(link.buttonName)
                        }
                    }
                }
            }
        }
        .frame(height: 250)
    }
}


// ピン留めリポジトリ
struct PinedRepositorys: View {
    var repositories: [Repository] = [
        Repository(icon: "icon", userID: "user1", title: "pygame", info: "pygameの何か", numStar: 3, lang: "python"),
        Repository(icon: "star", userID: "user2", title: "React", info: "reactの何か", numStar: 2, lang: "Typescript")
    ]
    
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                ForEach(repositories){ repo in
                    CardOfRepository(repository: repo)
                }
            }
            .padding()
        }
        .scrollIndicators(.hidden)
    }
}

// 構造体
struct Repository: Identifiable {
    let id = UUID()
    
    let icon: String
    let userID: String
    
    let title: String
    let info: String
    
    let numStar: Int
    let lang: String
}

// リポジトリ情報カード
struct CardOfRepository: View {
    let repository: Repository
    
    var body: some View {
        ZStack(alignment: .leading){
            Color.white
            
            VStack(alignment: .leading){
                HStack{
                    Image(systemName: repository.icon)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .background(.blue)
                        .clipShape(Circle())
                    
                    Text(repository.userID)
                        .foregroundStyle(.gray)
                }
                
                Text(repository.title)
                    .font(.title3)
                
                Text(repository.info)
                
                HStack {
                    HStack{
                        Image(systemName: "star.fill")
                        Text(String(repository.numStar))
                    }
                    
                    HStack{
                        Image(systemName: "circle.fill")
                        Text(repository.lang)
                    }
                }
            }
            .padding()
        }
        .aspectRatio(4 / 2, contentMode: .fit)
        .frame(width: 300)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray, lineWidth: 1)
        )

    }
    
}

#Preview{
//    CardOfRepository(repository: Repository(icon: "icon", userID: "user1", title: "pygame", info: "pygameの何か", numStar: 3, lang: "python"))
//    
//    PinedRepositorys()
    
    LinkButtonView()
}
