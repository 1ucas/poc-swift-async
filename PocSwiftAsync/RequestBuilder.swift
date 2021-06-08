//
//  RequestBuilder.swift
//  TesteSwiftAsync
//
//  Created by Lucas Ramos Maciel on 08/06/21.
//

import Foundation

struct RequestBuilder {
    static func makeRequest(with driver: CustomNetworkResult) -> URLRequest {
        switch driver {
        case .success:
            return URLRequest(url: URL(string: "https://jsonkeeper.com/b/03YQ")!)
        case .error:
            return URLRequest(url: URL(string: "https://jsonkeeper.com/b/EA91")!)
        case .failed:
            return URLRequest(url: URL(string: "https://jsonkeeper.com/b/GS2V")!)
        }
    }
}
