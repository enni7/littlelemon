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

struct Onboarding: View {
    
    @State var isLoggedIn = false
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                Text("Login")
                    .font(.largeTitle)
                    .padding([.bottom], 8)
                Group {
                    TextField("First Name",
                              text: $firstName)
                    TextField("Last Name",
                              text: $lastName)
                    TextField("Email",
                              text: $email)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                }
                .font(.title3)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal], 32)
                
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
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
