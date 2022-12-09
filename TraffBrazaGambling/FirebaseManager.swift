//
//  FirebaseManager.swift
//  TraffBrazaGambling
//
//  Created by Vlad Kyrylenko on 01.12.2022.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class FirebaseManager: ObservableObject {
    static var shared: FirebaseManager = {
        let instance = FirebaseManager()
        return instance
    }()
    
    private var dataBase = Firestore.firestore()
    @Published var users: [UserInfo] = []
    @Published var isLoggined = false {
        didSet {
            self.objectWillChange.send()
        }
    }
    
    private init() {
        if(Auth.auth().currentUser != nil) {
            isLoggined = true
        } else {
            isLoggined = false
        }
    }
    
    func signUpAnonimously() {
        Auth.auth().signInAnonymously { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            guard let user = authResult?.user else {
                print(error ?? "Unknown Error")
                return
            }
            
            strongSelf.createUserInfo(with: user.uid, name: "Anonimous")
            strongSelf.isLoggined = true
        }
    }
    
    func signUpWithEmailAndPassword(email: String, password: String, name: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            guard let user = authResult?.user else {
                print(error ?? "Unknown Error")
                return
            }
            
            strongSelf.createUserInfo(with: user.uid, name: name)
            strongSelf.isLoggined = true
        }
    }
    
    func signInWithEmailAndPassword(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password)
        isLoggined = true
    }
    
    func createUserInfo(with userId: String, name: String) {
        let userInfo = UserInfo(id: userId, name: name, balance: 2000, gamesPlayed: 0, gamesWon: 0)

        updateUserInfo(userInfo: userInfo)
    }
    
    func updateUserInfo(userInfo: UserInfo) {
        do {
            try dataBase.collection("users").document(userInfo.id).setData(from: userInfo)
        } catch {
            print(error)
        }
    }
    
    func getCurrentUserInfo() async throws -> UserInfo {
        if let user = Auth.auth().currentUser {
            let userDoc = try? await dataBase.collection("users").document(user.uid).getDocument()
            
            guard let userInfo: UserInfo = try userDoc?.data(as: UserInfo.self) else {
                throw FirebaseError.userInfoDoesntExist
            }
            return userInfo
        }
        throw FirebaseError.userIsNotloggedIn
    }
    
    func getUsersRatingList() {
        dataBase.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard let usersDocuments = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.users = usersDocuments.compactMap { (queryDocumentSnapshot) -> UserInfo? in
                return try? queryDocumentSnapshot.data(as: UserInfo.self)
            }
            
            self.users = self.users.sorted(){ rhs, lhs in
                rhs.balance > lhs.balance
            }
        }
    }
    
    func logOut() {
        do{
            try Auth.auth().signOut()
            isLoggined = false
        } catch {
            print(error)
        }
    }
    
    func deleteAccount() {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("error")
            return
        }
        
        dataBase.collection("users").document(uid).delete()
        Auth.auth().currentUser?.delete() { error in
            if let error = error {
                print(error)
            } else {
                print("success")
                self.isLoggined = false
            }
        }
    }
}


enum FirebaseError: Error {
    case userIsNotloggedIn
    case userInfoDoesntExist
}
