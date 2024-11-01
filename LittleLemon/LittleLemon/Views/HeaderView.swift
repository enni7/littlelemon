//
//  HeaderView.swift
//  LittleLemon
//
//  Created by Anna Izzo on 01/11/24.
//

import SwiftUI

struct HeaderView: View {
    var onProfileTap: (() -> Void)?
    
    var body: some View {
        ZStack{
            Image("logo_header")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            HStack{
                Spacer()
                ProfileImageView()
                    .frame(width: 44,
                           height: 44)
                    .padding([.vertical], 8)
                    .padding([.trailing], 24)
                    .onTapGesture {
                        onProfileTap?()
                    }
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
