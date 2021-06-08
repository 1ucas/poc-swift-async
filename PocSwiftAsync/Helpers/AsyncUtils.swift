//
//  AsyncUtils.swift
//  PocSwiftAsync
//
//  Created by Lucas Ramos Maciel on 08/06/21.
//

import Foundation

func delayCall() async {
    await withUnsafeContinuation { c in
        DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
            c.resume()
        }
    }
}
