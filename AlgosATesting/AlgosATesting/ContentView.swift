//
//  ContentView.swift
//  AlgosATesting
//
//  Created by vinay kamra on 29/07/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()

    var body: some View {
        
        VStack {
            Text("Algos Testing App - \(viewModel.items.count)")
                .font(.headline)
        }
        List {
            ForEach(viewModel.items, id: \.self) { item in
                Button(action: { viewModel.execute(type: item)} ) {
                    Text(item.rawValue)

                }
            }
            
        }
        .onAppear {
            viewModel.inititems()
        }
            
        .background(Color.gray.opacity(0.2))
    }
      
}

#Preview {
    ContentView()
}
