//
//  ApiRequestDispatcher.swift
//  Nimble
//
//  Created by javier pineda on 06/11/23.
//

import Foundation

class ApiRequestDispatcher {
    class func request<T: Codable>(apiRouter: ApiRouter) async throws -> T {        
        guard let url = URL(string: apiRouter.stringUrl) else { throw APIRequestError.badUrl }
        
        var urlRequest = URLRequest(url: url)
        print("URL: \(urlRequest)")
        urlRequest.httpMethod = apiRouter.method
        urlRequest.addValue("application/json", forHTTPHeaderField: HTTPHeaders.contentType)
        if let body = apiRouter.body {
            urlRequest.httpBody = body
            if let jsonString = NSString(data: body, encoding: String.Encoding.utf8.rawValue) {
                print("BODY: \(jsonString)")
            }
        }
        if let token = apiRouter.token {
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: HTTPHeaders.authorization)
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
                
                if let jsonString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                    print("DATA: \(jsonString)")
                }
                
                if let response = response as? HTTPURLResponse {
                    if !HTTPCodes.validResponseCode.contains(response.statusCode) {
                        return continuation.resume(with: .failure(APIRequestError.requestFailed))
                    }
                }
                
                do {
                    if data.isEmpty {
                        return continuation.resume(with: .success(NoResponse() as! T))
                    } else {
                        let responseObject = try JSONDecoder().decode(T.self, from: data)
                        DispatchQueue.main.async {
                            return continuation.resume(with: .success(responseObject))
                        }
                    }
                } catch {
                    return continuation.resume(with: .failure(error))
                }
            }
            dataTask.resume()
        }
    }
}
