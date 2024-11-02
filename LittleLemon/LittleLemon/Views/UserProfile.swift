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
    @State var firstNameEdit = ""
    @State var lastNameEdit = ""
    @State var emailEdit = ""

    @State var isEditing: Bool = false
    
    var body: some View {
        VStack {
            HeaderView(showImage: true,
                       showBack: true,
                       onBackTapped:  {
                self.presentation.wrappedValue.dismiss()
            })
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Personal information")
                    .font(.title3)
                    .padding([.bottom], 16)
                ProfileImageView()
                    .frame(width: 80, height: 80)
                    .padding([.bottom], 16)
                
                Group {
                    Text("First Name")
                    TextField("First Name",
                              text: $firstNameEdit)
                    .padding([.bottom], 8)
                    .font(.headline)
                    
                    Text("Last Name")
                    TextField("Last Name",
                              text: $lastNameEdit)
                    .padding([.bottom], 8)
                    .font(.headline)

                    Text("Email")
                    TextField("Email",
                              text: $emailEdit)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding([.bottom], 8)
                    .font(.headline)
                }
                .disableAutocorrection(true)
                .textFieldStyle(.roundedBorder)
                .font(.subheadline)
                .padding([.bottom], 8)
                .disabled(!isEditing)
                
                HStack{
                    Spacer()
                    Button {
                        if isEditing {
                            onSave()
                        } else {
                            isEditing  = true
                        }
                    } label: {
                        HStack{
                            if isEditing {
                                Label("Save", systemImage: "checkmark")
                                    .disabled(!isValidationSuccess)
                            } else {
                                Label("Edit", systemImage: "square.and.pencil")
                            }
                        }
                        .fontWeight(.medium)
                    }
                    .buttonStyle(.bordered)
                    .padding([.top], 16)
                    Spacer()
                }
                
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
        .navigationBarHidden(true)
        .onAppear{
            self.firstNameEdit = UserDefaults.standard.string(forKey: keyFirstName) ?? ""
            self.lastNameEdit = UserDefaults.standard.string(forKey: keyLastName) ?? ""
            self.emailEdit = UserDefaults.standard.string(forKey: keyEmail) ?? ""
        }
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
    
    private var isValidationSuccess: Bool {
        if !firstNameEdit.isEmpty,
           !lastNameEdit.isEmpty,
           !emailEdit.isEmpty,
           emailEdit.isValidEmail(){
            return true
        } else {
            return false
        }
    }

    private func onSave(){
        guard isValidationSuccess else {
            return
        }
        
        ///Save locally
        UserDefaults.standard.set(firstNameEdit, forKey: keyFirstName)
        UserDefaults.standard.set(lastNameEdit, forKey: keyLastName)
        UserDefaults.standard.set(emailEdit, forKey: keyEmail)
        
        isEditing = false
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile(shouldPopToRootView: .constant(false))
    }
}
