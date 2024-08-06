//
//  ContentView.swift
//  ARMenuApp
//
//  Created by Yemmanuru, Krishna Saimahith on 7/15/24.
//

import SwiftUI

struct ContentView: View {
    @State var isPresented: Bool = false
    @ObservedObject var viewModel = MenuViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.menuItems) { item in
                NavigationLink(destination: MenuItemDetailView(menuItem: item)) {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.description)
                            .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Menu")
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



