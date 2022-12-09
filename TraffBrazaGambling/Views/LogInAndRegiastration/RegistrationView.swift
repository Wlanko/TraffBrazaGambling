//
//  RegistrationView.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 03.12.2022.
//

import SwiftUI

struct RegistrationView: View {
    enum Field {
        case name
        case email
        case password
        case confirmPassword
    }
    
    private let firebaseManager =  FirebaseManager.shared
    
    @State private var email: String = ""
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @FocusState private var focusedField: Field?
    
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack {
            TextFieldPattern(text: $name, topLabel: "Name", placeholderText: "Enter your nickname", unremovablePrefix: "", needsSecurity: false)
                .focused($focusedField, equals: .name)
            TextFieldPattern(text: $email, topLabel: "Email", placeholderText: "Enter your email", unremovablePrefix: "", needsSecurity: false)
                .focused($focusedField, equals: .email)
            TextFieldPattern(text: $password, topLabel: "Password", placeholderText: "Enter password", unremovablePrefix: "", needsSecurity: true)
                .focused($focusedField, equals: .password)
            TextFieldPattern(text: $confirmPassword, topLabel: "Confirm password", placeholderText: "Confirm password", unremovablePrefix: "", needsSecurity: true)
                .focused($focusedField, equals: .confirmPassword)
            
            Button("Sign up") {
                registerButtonPressed(name: name, email: email, password: password, confirmPassword: confirmPassword)
            }
            .alert(isPresented: $showAlert){
                Alert(title: Text("Ups.."), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
            }
        }
        .onSubmit {
            switch focusedField {
            case .name:
                focusedField = .email
            case .email:
                focusedField = .password
            case .password:
                focusedField = .confirmPassword
            case .confirmPassword:
                registerButtonPressed(name: name, email: email, password: password, confirmPassword: confirmPassword)
            default:
                print("Creating account…")
            }
        }
    }
    func registerButtonPressed(name: String, email: String, password: String, confirmPassword: String){
        if password.isEmpty || email.isEmpty || name.isEmpty {
            showAlert = true
            alertMessage = "Please fill in all fields"
        } else if password.count < 6{
            showAlert = true
            alertMessage = "Password must contain at least 6 characters"
        } else if password != confirmPassword {
            showAlert = true
            alertMessage = "Those passwords didn’t match. Try again."
        } else {
            firebaseManager.signUpWithEmailAndPassword(email: email, password: password, name: name)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
