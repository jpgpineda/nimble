//
//  NimbleTests.swift
//  NimbleTests
//
//  Created by javier pineda on 04/11/23.
//

import XCTest
@testable import Nimble

final class NimbleTests: XCTestCase {

    func testLoginResponseTokenExists() async {
        // Arrange
        let apiGateway = AccessAPIGatewayImplementation()
        let useCase = AccessUseCaseImplementation(apiGateway: apiGateway)
        // Act
        do {
            let response: SignInResponseDTO = try await useCase.requestSignIn(parameters: SignInRequest())
            // Assert
            XCTAssertFalse(response.accessToken.isEmpty)
        } catch {
            // Assert
            XCTFail(error.localizedDescription)
        }
    }
    
    func testSurveyListIsNotEmpty() async {
        // Arrange
        let apiGateway = SurveyApiGatewayImplementation()
        let useCase = SurveyUseCaseImplementation(apiGateway: apiGateway)
        // Act
        do {
            let response: SurveyListDTO = try await useCase.fetchSurveys(parameters: FetchSurveysRequest())
            // Assert
            XCTAssertFalse(response.data.isEmpty)
        } catch {
            // Assert
            XCTFail(error.localizedDescription)
        }
    }
    
    func testInnactiveAtFromSurveyItemListIsNil() async {
        // Arrange
        let apiGateway = SurveyApiGatewayImplementation()
        // Act
        do {
            let response: SurveyListResponse = try await apiGateway.fetchSurveys(parameters: FetchSurveysRequest())
            // Assert
            XCTAssertNil(response.data.first?.attributes.inactiveAt)
        } catch {
            // Assert
            XCTFail(error.localizedDescription)
        }
    }
    
    func testProfileAvatarUrlIsNotEmpty() async {
        // Arrange
        let apiGateway = UserApiGatewayImplementation()
        let useCase = UserUseCaseImplementation(apiGateway: apiGateway)
        // Act
        do {
            let response: UserDTO = try await useCase.fetchUserProfile()
            // Assert
            XCTAssertFalse(response.avatarUrl.isEmpty)
        } catch {
            // Assert
            XCTFail(error.localizedDescription)
        }
    }
}
