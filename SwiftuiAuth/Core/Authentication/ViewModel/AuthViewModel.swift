//
//  AuthViewModel.swift
//  SwiftuiAuth
//
//  Created by man ching chan on 29/8/2023.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


protocol AuthenticationFormProtocol{
    
    var formIsValid : Bool {get}
}



@MainActor

class AuthViewModel : ObservableObject{
    
    @Published var userSession : FirebaseAuth.User?
    
    @Published var currentUser : User?

    @MainActor
    
    init(){
        
        self.userSession = Auth.auth().currentUser
        
        guard let userSession = self.userSession else {return}
        print(userSession.uid)
        
        Task{
            
            await fetchUser()
        }
    }
    
    
    func signIn(withEmail email: String, password:String) async throws{
        
        print("sign in")
        
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            
            self.userSession = result.user
            
            await fetchUser()
            
        }catch{
            
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
        
        
        
    }
    
    
    
    func createUser(withEmail email : String, password: String , fullname:String) async throws{

            print("create user")
            
            do{
                let result = try await Auth.auth().createUser(withEmail: email, password: password)
                self.userSession = result.user
                
                let user = User(id: result.user.uid, email: email, fullname: fullname)
                
                 let encodeUser = try Firestore.Encoder().encode(user)
                
                try await Firestore.firestore().collection("user").document(user.id).setData(encodeUser)
                
                await fetchUser()
            } catch {
                
                print("DEBUG : Failed to create \(error.localizedDescription)")
                
            }
            
      

    }
    
    func signOut(){
        
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        }
        catch{
            print("DEBUG failed to sign out with error \(error.localizedDescription)")
        }
        
    }
    
    
    func deleteAccount(){
        
        
    }
    
    
    func fetchUser() async{
        
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        print(uid)
        
        guard let snapshot = try? await Firestore.firestore().collection("user").document(uid).getDocument() else {return}
        

        
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("DEBUG current user \(self.currentUser ?? User.MOCK_USER)")
        
    }
    
}
