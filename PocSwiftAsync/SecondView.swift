//
//  SecondView.swift
//  PocSwiftAsync
//
//  Created by Lucas Ramos Maciel on 09/06/21.
//

import SwiftUI

struct SecondView: View {
    var body: some View {
        Text("Test")
//        AsyncImage(url: URL(string: "https://www.hackingwithswift.com/img/unwrap.png")) { phase in
//            switch phase {
//            case .empty:
//                ProgressView()
//            case .failure:
//                Image(systemName: "photo")
//            case .success(let loadedImage):
//                loadedImage
//                    .aspectRatio(contentMode: .fit)
//            @unknown default:
//                EmptyView()
//            }
//        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
