//
//  FriendsService.swift
//  RevolutFriendsPractice
//
//  Created by Ikmal Azman on 26/01/2023.
//

import Foundation

final class FriendsService {
    
    func getFriendsFromAPI() async throws -> [Friend] {
        let url = URL(string: "https://dummyjson.com/users")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        let decodedData = try decoder.decode(FriendsResponse.self, from: data)
        
        return decodedData.users
    }
}
