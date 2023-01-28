//
//  ContentView.swift
//  RevolutFriendsPractice
//
//  Created by Ikmal Azman on 23/01/2023.
//

import SwiftUI
import NukeUI

struct FriendsView: View {
    
    /// `@StateObject`: tell SwiftUI to listen that this View to listen any changes in this viewModel
    @StateObject var viewModel = FriendsViewModel()
    
    var body: some View {
        List {
            Section {
                ForEach(viewModel.friends) { friend in
                    HStack {
                        LazyImage(source: friend.image)
                            .frame(width: 50, height: 50)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(friend.firstName)
                                .font(.title3)
                                .bold()
                            Text("@\(friend.username)")
                                .foregroundColor(.gray)
                        }
                    }
                }
            } header: {
                Text("Friends List")
                    .font(.headline)
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            Task {
                await viewModel.loadFriends()
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
