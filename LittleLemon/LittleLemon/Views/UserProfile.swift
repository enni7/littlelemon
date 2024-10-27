//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Anna Izzo on 27/10/24.
//

import SwiftUI

struct UserProfile: View {
    
    @Environment(\.presentationMode) var presentation

//    @State var showAlert = false
    
    let firstName = UserDefaults.standard.string(forKey: keyFirstName)
    let lastName = UserDefaults.standard.string(forKey: keyLastName)
    let email = UserDefaults.standard.string(forKey: keyEmail)
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Personal information")
                .font(.title3)
                .padding([.bottom], 16)
            Image("profile-image-placeholder")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .padding([.bottom], 16)
            Group {
                Text(firstName ?? "-")
                Text(lastName ?? "-")
                Text(email ?? "-")
            }
            .font(.subheadline)
            .padding([.bottom], 8)

            HStack{
                Spacer()
                Button {
                    onLogout()
                } label: {
                    Label("Logout", systemImage: "rectangle.portrait.and.arrow.right")
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
            .padding([.top], 32)
            Spacer()
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               alignment: .topLeading)
        .padding([.horizontal], 24)
        .padding([.vertical], 8)

        /*
        .alert("Logout", isPresented: $showAlert, actions: {
            Button("Cancel", role: .cancel) {
                showAlert = false
            }
            Button("Logout", role: .destructive) {
                showAlert = false
                onLogout()
            }
        }) {
            Text("Are you sure you want to logout?")
        }
         */
    }
}

extension UserProfile {
    private func onLogout(){
        UserDefaults.standard.set(nil, forKey: keyFirstName)
        UserDefaults.standard.set(nil, forKey: keyLastName)
        UserDefaults.standard.set(nil, forKey: keyEmail)
        UserDefaults.standard.set(false, forKey: keyIsLoggedIn)
        self.presentation.wrappedValue.dismiss()
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
