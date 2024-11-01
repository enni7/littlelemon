//
//  Home.swift
//  LittleLemon
//
//  Created by Anna Izzo on 27/10/24.
//

import SwiftUI

struct Home: View {
    
    let persistence = PersistenceController.shared

    var body: some View {
        TabView() {
            Menu()
                .tabItem {
                    Label("Menu",
                          systemImage: "list.dash")
                }
            UserProfile()
                .tabItem {
                    Label("Profile",
                          systemImage: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.managedObjectContext, persistence.container.viewContext)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
