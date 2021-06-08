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
        do {
            let (data, _) = try await URLSession.shared.data(for: request, delegate: nil)
            await delayCall()
            return .success(try JSONDecoder().decode(BogusResponse.self, from: data))
        } catch {
            return .failure(error)
        }
    }
}
