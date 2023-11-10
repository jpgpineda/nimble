//
//  SurveyListDTO.swift
//  Nimble
//
//  Created by javier pineda on 09/11/23.
//

import Foundation

struct SurveyListDTO {
    let data: [SurveyDTO]
    
    init(with response: SurveyListResponse) {
        data = response.data.compactMap({             SurveyDTO(with: $0)
        })
    }
}

struct SurveyDTO {
    let id: String
    let type: TypeEnum
    let attributes: SurveyAttributesDTO
    
    init(with response: Survey) {
        id = response.id
        type = response.type
        attributes = SurveyAttributesDTO(with: response.attributes)
    }
}

struct SurveyAttributesDTO {
    let title: String
    let description: String
    let coverImageUrl: String
    
    init(with response: Attributes) {
        title = response.title
        description = response.description
        coverImageUrl = response.coverImageURL
    }
}
