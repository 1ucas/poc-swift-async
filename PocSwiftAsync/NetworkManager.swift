//
//  NetworkManager.swift
//  TesteSwiftAsync
//
//  Created by Lucas Ramos Maciel on 08/06/21.
//

import Foundation

enum CustomNetworkResult {
    case success
    case error
    case failed
}

class NetworkManager {
    
    func retrieveStatus(with driver: CustomNetworkResult) async -> String {
        let request = RequestBuilder.makeRequest(with: driver)
        let result = await AsyncHttpClient().makeCall(request: request)
        
        return handleResult(result)
    }
    
    private func handleResult(_ result: Result<BogusResponse, Error>) -> String {
        switch result {
        case .success(let response):
            return response.error ? "Error Ocurred" : response.text
        case .failure(_):
            return "Failed: Could not retrieve response!!!"
        }
    }
}
