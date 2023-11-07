//
//  ApiRequestDispatcher.swift
//  Nimble
//
//  Created by javier pineda on 06/11/23.
//

import Foundation

class ApiRequestDispatcher {
    class func request<T: Codable>(apiRouter: ApiRouter) async throws -> T {
        var components = URLComponents()
        components.host = apiRouter.host
        components.path = apiRouter.path
        
        guard let url = components.url else { throw APIRequestError.badUrl }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = apiRouter.method
        if let body = apiRouter.body {
            urlRequest.httpBody = body
        }
        let session = URLSession(configuration: .default)
        return try await withCheckedThrowingContinuation { continuation in
            let dataTask = session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    return continuation.resume(with: .failure(error))
                }
                
                guard let data = data else {
                    return continuation.resume(with: .failure(APIRequestError.noData))
                }
                
                guard let response = response as? HTTPURLResponse,
                      response.statusCode == HTTPCodes.ok else {
                    return continuation.resume(with: .failure(APIRequestError.requestFailed))
                }
                
                do {
                    let responseObject = try JSONDecoder().decode(T.self, from: data)
                    DispatchQueue.main.async {
                        return continuation.resume(with: .success(responseObject))
                    }
                } catch {
                    return continuation.resume(with: .failure(error))
                }
            }
            dataTask.resume()
        }
    }
}
