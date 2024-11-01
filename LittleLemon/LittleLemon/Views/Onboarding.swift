//
//  Onboarding.swift
//  LittleLemon
//
//  Created by Anna Izzo on 27/10/24.
//

import SwiftUI

let keyFirstName = "first_name_key"
let keyLastName = "last_name_key"
let keyEmail = "email_key"
let keyIsLoggedIn = "is_logged_in_key"

struct Onboarding: View {
    
    @State var isLoggedIn = false
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: Home(rootIsActive: $isLoggedIn),
                               isActive: $isLoggedIn) {
                    EmptyView()
                }
                               .isDetailLink(false)
                HeaderView(showImage: false,
                           showBack: false)

                HeroView()
                    .padding([.vertical], 24)
                    .background {
                        Color.greenBg
                    }
                Spacer()

                Group {
                    TextField("First Name",
                              text: $firstName)
                    TextField("Last Name",
                              text: $lastName)
                    TextField("Email",
                              text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                }
                .disableAutocorrection(true)
                .font(.title3)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal], 32)
                
                Spacer()
                Spacer()
                Spacer()
                
                Button {
                    onRegister()
                } label: {
                    Text("Register")
                }
                .disabled(!isValidationSuccess)
                .buttonStyle(.borderedProminent)
                .font(.title3)
                .padding([.top], 16)
            }
            .onAppear {
                if UserDefaults.standard.bool(forKey: keyIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
    
}

extension Onboarding {
    
    private var isValidationSuccess: Bool {
        if !firstName.isEmpty,
           !lastName.isEmpty,
           !email.isEmpty,
           email.isValidEmail(){
            return true
        } else {
            return false
        }
    }

    private func onRegister(){
        guard isValidationSuccess else {
            return
        }
        
        ///Save locally
        UserDefaults.standard.set(firstName, forKey: keyFirstName)
        UserDefaults.standard.set(lastName, forKey: keyLastName)
        UserDefaults.standard.set(email, forKey: keyEmail)

        isLoggedIn = true
        UserDefaults.standard.set(true, forKey: keyIsLoggedIn)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
