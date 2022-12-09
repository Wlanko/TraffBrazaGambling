//
//  LogInView.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 01.12.2022.
//

import SwiftUI

struct LogInView: View {
    enum Field {
        case email
        case password
    }
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var showAlert: Bool = false
    @State var goToRegistrationView: Bool = false
    @FocusState private var focusedField: Field?
    private let firebaseManager = FirebaseManager.shared
    
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                TextFieldPattern(text: $email, topLabel: "Email", placeholderText: "Enter your email", unremovablePrefix: "", needsSecurity: false)
                    .focused($focusedField, equals: .email)
                
                TextFieldPattern(text: $password, topLabel: "Password", placeholderText: "Enter password", unremovablePrefix: "", needsSecurity: true)
                    .focused($focusedField, equals: .password)
                    
                Button("Log In") {
                    logInButtonPressed(email: email, password: password)
                }
                .font(.system(size: 18))
                .padding(5)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("ups"), message: Text("Plese fill in all fields"), dismissButton: .default(Text("Ok")))
                }
                
                HStack {
                    NavigationLink(isActive: $goToRegistrationView) { RegistrationView()
                    } label: {
                        Button("Sign Up") {
                            goToRegistrationView = true
                        }
                    }
                    Text("or continue")
                    
                    Button("anonimously"){
                        firebaseManager.signUpAnonimously()
                        //isLogined = true
                    }
                }
                Spacer()
            }
            .contentShape(Rectangle())
            .onSubmit {
                switch focusedField {
                case .email:
                    focusedField = .password
                case .password:
                    logInButtonPressed(email: email, password: password)
                default:
                    print("Creating account…")
                }
            }
            .navigationBarTitle("LogIn", displayMode: .inline)
            .onTapGesture {
                self.hideKeyboard()
            }
        }
    }
    
    func logInButtonPressed(email: String, password: String) {
        if !email.isEmpty && !password.isEmpty {
            firebaseManager.signInWithEmailAndPassword(email: email, password: password)
            //isLogined = true
        } else {
            showAlert = true
        }
    }
    
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
