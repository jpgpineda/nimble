//
//  TokenManager.swift
//  Nimble
//
//  Created by javier pineda on 09/11/23.
//

import Foundation

struct TokenManager {
    static var shared = TokenManager()
    var identifier: String = .empty
    
    func canEncryptCredentials(credential: CredentialDTO) -> Bool {
        guard let parsedPassword = credential.token.data(using: .utf8) else { return false }
        let attributes = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: credential.id,
            kSecValueData as String: parsedPassword
        ] as CFDictionary
        return SecItemAdd(attributes, nil) == errSecSuccess
    }
    
    func canRetrieveEncryptedCrendentials(id: String) -> CredentialDTO? {
        var item: CFTypeRef?
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: id,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]
        
        if SecItemCopyMatching(query as CFDictionary, &item) == noErr {
            if let existingItem = item as? [String: Any],
               let id = existingItem[kSecAttrAccount as String] as? String,
               let tokenData = existingItem[kSecValueData as String] as? Data,
               let token = String(data: tokenData, encoding: .utf8) {
                return CredentialDTO(id: id, token: token)
            } else {
                print("Something go wrong parsing the keychain data")
                return nil
            }
        } else {
            print("Something go wrong accessing keychain")
            return nil
        }
    }
}
