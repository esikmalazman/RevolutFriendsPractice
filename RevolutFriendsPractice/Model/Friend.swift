//
//  Friends.swift
//  RevolutFriendsPractice
//
//  Created by Ikmal Azman on 23/01/2023.
//

import Foundation

struct FriendsResponse : Decodable {
    let users : [Friend]
}

struct Friend : Identifiable, Decodable {
    let id : Int
    let firstName : String
    let username : String
    let image : String
}

extension Friend {
    static var mock : Friend {
        Friend(id: 1, firstName: "Eva", username: "@evaperez", image: "person.circle.fill")
    }
}


extension Array<Friend> {
    static var mock : [Friend] {
        [
            Friend(id: 1, firstName: "Eva", username: "@evaperez", image: "eva"),
            Friend(id: 2, firstName: "Irish", username: "@irishlogan", image: "irish"),
            Friend(id: 3, firstName: "Tate", username: "@erictate", image: "tate")
        ]
    }
}
