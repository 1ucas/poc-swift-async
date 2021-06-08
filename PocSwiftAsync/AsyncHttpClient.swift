//
//  AsyncHttpClient.swift
//  TesteSwiftAsync
//
//  Created by Lucas Ramos Maciel on 08/06/21.
//

import Foundation

struct BogusResponse : Decodable {
    let text:String
    let error:Bool
}

class AsyncHttpClient {
    
    func makeCall(request: URLRequest) async -> Result<BogusResponse, Error> {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        do {
            let (data, _) = try await session.data(for: request, delegate: nil)
            return .success(try JSONDecoder().decode(BogusResponse.self, from: data))
        } catch {
            return .failure(error)
        }
    }
}
