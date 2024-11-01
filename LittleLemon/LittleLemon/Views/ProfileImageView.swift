//
//  ProfileImageView.swift
//  LittleLemon
//
//  Created by Anna Izzo on 01/11/24.
//

import SwiftUI

struct ProfileImageView: View {
    var body: some View {
        Image("profile-image-placeholder")
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(
                Circle()
                    .strokeBorder(Color.greenBg, lineWidth: 0.8)
            )
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView()
    }
}
