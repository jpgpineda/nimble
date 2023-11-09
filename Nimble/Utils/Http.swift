//
//  Http.swift
//  Nimble
//
//  Created by javier pineda on 06/11/23.
//

import Foundation

struct HttpMethod {
    static let GET = "GET"
    static let POST = "POST"
}

struct HTTPCodes {
    static let created  = 201
    static let ok       = 200
    static let accepted = 202
    
    static let validResponseCode = [created, accepted, ok]
}
