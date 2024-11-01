//
//  Home.swift
//  LittleLemon
//
//  Created by Anna Izzo on 27/10/24.
//

import SwiftUI

struct Home: View {
    
    let persistence = PersistenceController.shared
    @State var showProfile: Bool = false
    @Binding var rootIsActive : Bool

    var body: some View {
        VStack{
            NavigationLink(destination: UserProfile(shouldPopToRootView: $rootIsActive),
                           isActive: $showProfile) {
                EmptyView()
            }
                           .isDetailLink(false)
            HeaderView {
                showProfile = true
            }
            Menu()
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.managedObjectContext,
                      persistence.container.viewContext)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home(rootIsActive: .constant(false))
    }
}
