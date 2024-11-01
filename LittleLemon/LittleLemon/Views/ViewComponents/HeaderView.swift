//
//  HeaderView.swift
//  LittleLemon
//
//  Created by Anna Izzo on 01/11/24.
//

import SwiftUI

struct HeaderView: View {
    var showImage: Bool
    var showBack: Bool
    var onProfileTap: (() -> Void)?
    var onBackTapped: (() -> Void)?

    var body: some View {
        ZStack{
            Image("logo_header")
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            HStack{
                if showBack {
                    Button {
                        onBackTapped?()
                    } label: {
                        Image(systemName: "arrow.left.circle.fill")
                            .resizable()
                            .frame(width: 30,
                                   height: 30)
                            .padding([.horizontal], 24)
                    }
                }

                Spacer()
                if showImage {
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
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showImage: true,
                   showBack: true)
    }
}
