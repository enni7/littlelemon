//
//  Home.swift
//  LittleLemon
//
//  Created by Anna Izzo on 27/10/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView() {
            Menu()
                .tabItem {
                    Label("Menu",
                          systemImage: "list.dash")
                }
            Menu()
                .tabItem {
                    Label("Menu",
                          systemImage: "list.dash")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
