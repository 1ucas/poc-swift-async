//
//  ContentView.swift
//  TesteSwiftAsync
//
//  Created by Lucas Ramos Maciel on 08/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var title = "Hello Porto"
    @State var isLoading = false
    
    var body: some View {
        VStack {
            ReloadableText(title: $title, isLoading: $isLoading)
            ButtonList(title: $title, isLoading: $isLoading)
        }
    }
}

fileprivate struct ReloadableText: View {
    
    @Binding var title: String
    @Binding var isLoading: Bool
    
    var body: some View {
        if(isLoading) {
            ProgressView()
                .padding()
        } else {
            Text(title)
                .padding()
        }
    }
}

fileprivate struct ButtonList: View {
    
    @Binding var title: String
    @Binding var isLoading: Bool
    
    var body: some View {
        List {
            Button("Network Success") {
                loadData(with: .success)
            }
            Button("Network Error") {
                loadData(with: .error)
            }
        }.refreshable {
            loadData(with: .failed)
        }
    }
    
    private func loadData(with driver: CustomNetworkResult) {
        isLoading = true
        async {
            self.title = await NetworkManager().retrieveStatus(with: driver)
            isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//https://github.com/apple/swift/blob/main/stdlib/public/Concurrency/SourceCompatibilityShims.swift
