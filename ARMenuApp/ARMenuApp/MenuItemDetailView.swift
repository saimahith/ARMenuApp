//
//  MenuItemDetailView.swift
//  ARMenuApp
//
//  Created by Yemmanuru, Krishna Saimahith on 7/17/24.
//
import SwiftUI
import RealityKit

struct MenuItemDetailView: View {
    var menuItem: MenuItem
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let url = URL(string: menuItem.imageUrl) {
                AsyncImage(url: url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                } placeholder: {
                    ProgressView()
                }
            }
            Text(menuItem.description)
                .font(.body)
            Text("Nutritional Information: \(menuItem.nutritionalInfo)")
                .font(.body)
            Text("Price: \(menuItem.price, specifier: "%.2f")")
                .font(.headline)
            Spacer()
            Button {
                isPresented.toggle()
            } label: {
                Text("View in AR")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            .fullScreenCover(isPresented: $isPresented) {
                SheetView(isPresented: $isPresented, modelName: menuItem.modelFileName)
            }
            Spacer()
        }
        .padding()
        .navigationTitle(menuItem.name)
    }
}

struct MenuItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleItem = MenuItem(id: "1", name: "Sample Item", description: "This is a sample description", price: 9.99, nutritionalInfo: "Sample nutritional info", imageUrl: "https://via.placeholder.com/150", modelFileName: "Double_cheeseburger.usdz")
        MenuItemDetailView(menuItem: sampleItem)
    }
}
