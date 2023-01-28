//
//  FriendsViewModel.swift
//  RevolutFriendsPractice
//
//  Created by Ikmal Azman on 26/01/2023.
//

import Foundation

/// `@MainActor` : let compiler know any code from async await that update the property it should update in the main thread
/// `ObservableObject`: protocol to allow SwiftUI know if the state in viewModel change, the View need to update
@MainActor
final class FriendsViewModel : ObservableObject {
    
    let service = FriendsService()
    /// `Published`: Combine Property Wrapper, allow to let SwiftUI know if it change the view need to update
    @Published var friends : [Friend] = []
    
    func loadFriends() async {
        do {
            let service = FriendsService()
            friends = try await service.getFriendsFromAPI()
        } catch {
            print(error)
        }
    }
}
