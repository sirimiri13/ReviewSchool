//
//  Post.swift
//  USReview
//
//  Created by Trịnh Vũ Hoàng on 11/01/2021.
//

import Foundation

import FirebaseFirestore

class Post {
    var postID: String? = ""
    var schoolID: String? = ""
    var userID: String? = ""
    var userName: String? = ""
    var title: String? = ""
    var content: String? = ""
    var likes: Int? = 0
    var isVerified: Bool? = false
    var createdDate: Timestamp? = nil
    var likedUsers: Array<String>? = nil
    var comments: Array<Dictionary<String, Any>>? = nil
    
    init(postID: String?, schoolID: String?, userID: String?, userName: String?, title: String?, content: String?, likes: Int?, isVerified: Bool?, createdDate: Timestamp?) {
        self.postID = postID
        self.schoolID = schoolID
        self.userID = schoolID
        self.userName = userName
        self.title = title
        self.content = content
        self.likes = likes
        self.isVerified = isVerified
        self.createdDate = createdDate
    }
    
    init(_ post: Post) {
        self.postID = post.postID
        self.schoolID = post.schoolID
        self.userID = post.schoolID
        self.userName = post.userName
        self.title = post.title
        self.content = post.content
        self.likes = post.likes
        self.isVerified = post.isVerified
        self.createdDate = post.createdDate
    }
    
    init(_ snapshotData: DocumentSnapshot){
        self.postID = snapshotData.data()!["postID"] as? String
        self.schoolID = snapshotData.data()!["schoolID"] as? String
        self.userID = snapshotData.data()!["userID"] as? String
        self.userName = snapshotData.data()!["userName"] as? String
        self.title = snapshotData.data()!["title"] as? String
        self.content = snapshotData.data()!["content"] as? String
        self.likes = snapshotData.data()!["likes"] as? Int
        self.isVerified = snapshotData.data()!["isVerified"] as? Bool
        self.createdDate = snapshotData.data()!["createdDate"] as? Timestamp
        self.likedUsers = snapshotData.data()!["likedUsers"] as? Array<String>
        self.comments = snapshotData.data()!["comments"] as? Array<Dictionary<String, Any>>
    }
    
    func setPost(postID: String?, schoolID: String?, userID: String?, userName: String?, title: String?, content: String?, likes: Int?, isVerified: Bool?, createdDate: Timestamp?) {
        self.postID = postID
        self.schoolID = schoolID
        self.userID = schoolID
        self.userName = userName
        self.title = title
        self.content = content
        self.likes = likes
        self.isVerified = isVerified
        self.createdDate = createdDate
    }
    
    func setPostWithPost(_ post: Post) {
        self.postID = post.postID
        self.schoolID = post.schoolID
        self.userID = post.schoolID
        self.userName = post.userName
        self.title = post.title
        self.content = post.content
        self.likes = post.likes
        self.isVerified = post.isVerified
        self.createdDate = post.createdDate
    }
    
    func setPostWithSnapshotData(_ snapshotData: DocumentSnapshot) {
        self.postID = snapshotData.data()!["postID"] as? String
        self.schoolID = snapshotData.data()!["schoolID"] as? String
        self.userID = snapshotData.data()!["userID"] as? String
        self.userName = snapshotData.data()!["userName"] as? String
        self.title = snapshotData.data()!["title"] as? String
        self.content = snapshotData.data()!["content"] as? String
        self.likes = snapshotData.data()!["likes"] as? Int
        self.isVerified = snapshotData.data()!["isVerified"] as? Bool
        self.createdDate = snapshotData.data()!["createdDate"] as? Timestamp
        self.likedUsers = snapshotData.data()!["likedUsers"] as? Array<String>
        self.comments = snapshotData.data()!["comments"] as? Array<Dictionary<String, Any>>
    }
    
    func isCurrentUserLikedPost() -> Bool {
        let currentUserID = UserDefaults.standard.string(forKey: "userID")
        if (likedUsers == nil || likedUsers?.count == 0) {
            return false
        }
        else {
            for i in 0..<likedUsers!.count {
                if (likedUsers![i] == currentUserID) {
                    return true
                }
            }
            return false
        }
    }
}
