//
//  FetchSurveysRequest.swift
//  Nimble
//
//  Created by javier pineda on 09/11/23.
//

import Foundation

struct FetchSurveysRequest {
    let pageNumber: Int
    let pageSize: Int
    
    init(pageNumber: Int,
         pageSize: Int) {
        self.pageNumber = pageNumber
        self.pageSize = pageSize
    }
    
    init() {
        pageNumber = .zero
        pageSize = .zero
    }
}
