//
//  HeroView.swift
//  LittleLemon
//
//  Created by Anna Izzo on 01/11/24.
//

import SwiftUI

struct HeroView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Little Lemon")
                .font(.title)
                .fontDesign(.serif)
                .fontWeight(.semibold)
                .foregroundColor(.littleYellow)
            HStack {
                VStack(alignment: .leading){
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
                .padding([.trailing], 16)
                Spacer(minLength: 0)
                
                Image("hero_image")
                    .resizable()
                    .frame(width: 90,
                           height: 90)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 12)
                    )
            }
        }
        .padding([.horizontal], 24)
        .padding([.bottom], 8)
        .frame(minWidth: 0,
               maxWidth: .infinity,
               alignment: .leading)
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView()
    }
}
