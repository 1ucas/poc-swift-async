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
            let data = try await withCheckedThrowingContinuation { continuation in
                URLSession.shared.dataTask(with: request) { data, _, _  in
                    continuation.resume(returning: data)
                }
            }
            await delayCall()
            return .success(try JSONDecoder().decode(BogusResponse.self, from: data!))
        } catch {
            return .failure(error)
        }
    }
}
