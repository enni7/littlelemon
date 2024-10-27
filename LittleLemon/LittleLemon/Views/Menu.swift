//
//  Menu.swift
//  LittleLemon
//
//  Created by Anna Izzo on 27/10/24.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack(alignment: .leading){
            VStack(alignment: .leading) {
                Text("Little Lemon")
                    .font(.title)
                Text("Chicago")
                    .fontWeight(.light)
                    .padding([.bottom], 4)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                    .font(.subheadline)
            }
            .padding([.horizontal, .bottom], 24)
            
            List {
                Text("Lorem ipsum")
                Text("Lorem ipsum")
            }
            .listStyle(.inset)
            Spacer()
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
