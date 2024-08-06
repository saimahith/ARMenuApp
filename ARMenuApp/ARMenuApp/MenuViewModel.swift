//
//  MenuViewModel.swift
//  ARMenuApp
//
//  Created by Yemmanuru, Krishna Saimahith on 7/16/24.
//

import Foundation
import FirebaseFirestore

class MenuViewModel: ObservableObject {
    @Published var menuItems = [MenuItem]()

    private var db = Firestore.firestore()

    func fetchData() {
        db.collection("menuItems").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                self.menuItems = querySnapshot?.documents.compactMap { document in
                    let data = document.data()
                    let id = document.documentID
                    let name = data["name"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let price = data["price"] as? Double ?? 0.0
                    let nutritionalInfo = data["nutritionalInfo"] as? String ?? ""
                    let imageUrl = data["imageUrl"] as? String ?? ""
                    let modelFileName = data["modelFileName"] as? String ?? ""
                    return MenuItem(id: id, name: name, description: description, price: price, nutritionalInfo: nutritionalInfo, imageUrl: imageUrl, modelFileName: modelFileName)
                } ?? []
            }
        }
    }
}



