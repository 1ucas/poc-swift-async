//
//  ContentView.swift
//  TesteSwiftAsync
//
//  Created by Lucas Ramos Maciel on 08/06/21.
//

import SwiftUI

struct FirstView: View {
    
    @State var textToDisplay = "Hello People!"
    @State var isLoading = false
    
    var body: some View {
        VStack {
            ReloadableText(textToDisplay: $textToDisplay, isLoading: $isLoading)
            ButtonList(textToDisplay: $textToDisplay, isLoading: $isLoading)
            Spacer()
            StandaloneView()
        }
    }
}

fileprivate struct ReloadableText: View {
    
    @Binding var textToDisplay: String
    @Binding var isLoading: Bool
    
    var body: some View {
        if(isLoading) {
            ProgressView()
                .padding()
        } else {
            Text(textToDisplay)
                .padding()
        }
    }
}

fileprivate struct ButtonList: View {
    
    @Binding var textToDisplay: String
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
            self.textToDisplay = await NetworkManager().retrieveStatus(with: driver)
            isLoading = false
        }
    }
}

fileprivate struct StandaloneView: View {
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("Nova View Independente")
                    .padding()
                Spacer()
                NavigationLink(destination: SecondView()) {
                    Text("Clique Aqui")
                }.padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}

//https://github.com/apple/swift/blob/main/stdlib/public/Concurrency/SourceCompatibilityShims.swift
