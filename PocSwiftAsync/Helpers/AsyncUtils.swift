//
//  AsyncUtils.swift
//  PocSwiftAsync
//
//  Created by Lucas Ramos Maciel on 08/06/21.
//

import Foundation

func delayCall() async {
    // make sure you call resume 1x and only once
    do {
        try await withCheckedThrowingContinuation { c in
            DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
                c.resume()
//                c.resume(with: .success(""))
//                c.resume(throwing: .DecodingError)
            }
        }
    } catch {}
    
//    await withCheckedContinuation { c in
//        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
//            c.resume()
//        }
//    }

//   more performance (trivial for normal usage)
//    await withUnsafeContinuation { c in
//        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
//            c.resume()
//        }
//    }
    
    
    // https://developer.apple.com/documentation/swift/3814988-withcheckedcontinuation
    // https://app.coderpad.io/PG44P2H4
}
