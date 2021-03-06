//
//  MusicsViewModel.swift
//  SpotifyClone
//
//  Created by Teerat Prasitwet on 19/11/2564 BE.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

class MusicsViewModel: ObservableObject {
    @Published var musics = [Music]()
    
    init(){
        fetchMusics()
    }
    
    func fetchMusics(){
        Firestore.firestore().collection("musics").getDocuments { (snap, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let documents = snap?.documents else { return }
            
            self.musics = documents.compactMap { try? $0.data(as: Music.self)}
        }
    }
}
