//
//  SheetView.swift
//  ARMenuApp
//
//  Created by Yemmanuru, Krishna Saimahith on 7/17/24.
//

import SwiftUI

struct SheetView: View {
    @Binding var isPresented: Bool
    @State var modelName: String
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ARViewContainer(modelName: $modelName)
                .ignoresSafeArea(edges: .all)
            
            Button {
                isPresented.toggle()
            } label: {
                Image(systemName: "xmark.circle")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
            }
            .padding(24)
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView(isPresented: .constant(true), modelName: "Double_cheeseburger.usdz")
    }
}
