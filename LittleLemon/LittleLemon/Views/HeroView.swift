//
//  HeroView.swift
//  LittleLemon
//
//  Created by Anna Izzo on 01/11/24.
//

import SwiftUI

struct HeroView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Little Lemon")
                .font(.title)
                .fontDesign(.serif)
                .fontWeight(.semibold)
                .foregroundColor(.littleYellow)
            Text("Chicago")
                .fontWeight(.light)
                .padding([.bottom], 4)
                .fontDesign(.serif)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.littleWhite)
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                .font(.subheadline)
                .foregroundColor(.littleWhite)
        }
        .padding([.horizontal], 24)
        .padding([.bottom], 8)
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
