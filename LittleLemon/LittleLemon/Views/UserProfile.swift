//
//  UserProfile.swift
//  LittleLemon
//
//  Created by Anna Izzo on 27/10/24.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation

    @Binding var shouldPopToRootView : Bool
    @State var showAlert = false
    
    let firstName = UserDefaults.standard.string(forKey: keyFirstName)
    let lastName = UserDefaults.standard.string(forKey: keyLastName)
    let email = UserDefaults.standard.string(forKey: keyEmail)
    
    var body: some View {
        VStack {
            HeaderView(showImage: true,
                       showBack: true,
                       onBackTapped:  {
                self.presentation.wrappedValue.dismiss()
            })
            
            VStack(alignment: .leading) {
                Text("Personal information")
                    .font(.title3)
                    .padding([.bottom], 16)
                ProfileImageView()
                    .frame(width: 80, height: 80)
                    .padding([.bottom], 16)
                
                Group {
                    Text(firstName ?? "-")
                    Text(lastName ?? "-")
                    Text(email ?? "-")
                }
                .font(.subheadline)
                .padding([.bottom], 8)
                
                Spacer()
                
                Button {
                    showAlert = true
                } label: {
                    HStack{
                        Spacer()
                        Label("Logout", systemImage: "rectangle.portrait.and.arrow.right")
                        Spacer()
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding([.bottom], 32)
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   alignment: .topLeading)
            .padding([.horizontal], 24)
            .padding([.vertical], 8)
        }
        .navigationBarBackButtonHidden(true)
        
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
    }
}

extension UserProfile {
    private func onLogout(){
        UserDefaults.standard.set(nil, forKey: keyFirstName)
        UserDefaults.standard.set(nil, forKey: keyLastName)
        UserDefaults.standard.set(nil, forKey: keyEmail)
        UserDefaults.standard.set(false, forKey: keyIsLoggedIn)
        self.shouldPopToRootView = false
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(shouldPopToRootView: .constant(false))
    }
}
