//
//  FirebaseCheckView.swift
//  ARMenuApp
//
//  Created by Yemmanuru, Krishna Saimahith on 7/16/24.
//

import SwiftUI
import Firebase

struct FirebaseCheckView: View {
    @State private var message = "Checking Firebase Configuration..."

    var body: some View {
        Text(message)
            .padding()
            .onAppear(perform: checkFirebase)
    }

    func checkFirebase() {
        if FirebaseApp.app() != nil {
            message = "Firebase is configured correctly."
        } else {
            message = "Firebase is not configured correctly."
        }
    }
}

struct FirebaseCheckView_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseCheckView()
    }
}

