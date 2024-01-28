//
//  MainTabView.swift
//  NetflixVision
//
//  Created by Turdesan Csaba on 24/01/2024.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView{
            HomeView()
                .modifier(TabItemModifier(systemImage: "house", text: "Home"))
            
            ComingSoonView()
                .modifier(TabItemModifier(systemImage: "play.circle", text: "Coming soon"))
            
            SearchView()
                .modifier(TabItemModifier(systemImage: "magnifyingglass", text: "Search"))
            
            DownLoadsView()
                .modifier(TabItemModifier(systemImage: "arrow.down.to.line", text: "Downloads"))
        }
    }
}

struct TabItemModifier: ViewModifier {
    let systemImage: String
    let text: String
    
    func body(content: Content) -> some View {
        content
            .tabItem {
                VStack{
                    Image(systemName: systemImage)
                    Text(text)
                }
            }
    }
}

#Preview {
    MainTabView()
}
