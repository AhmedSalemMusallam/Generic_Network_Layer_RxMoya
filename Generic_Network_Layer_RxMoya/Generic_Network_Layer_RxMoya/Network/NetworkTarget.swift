//
//  NetworkTarget.swift
//  Generic_Network_Layer_RxMoya
//
//  Created by Ahmed Salem on 07/04/2023.
//

import Foundation
import Moya

enum UserServices
{
    case readUsers
    case createUsers(String)
}

extension UserServices : TargetType{
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
    
    var path: String {
        return "/users"
    }
    
    var method: Moya.Method {
        switch self {
        case .readUsers:
            return .get
        case .createUsers(_):
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .readUsers:
            return .requestPlain
        case .createUsers(_):
            return .requestParameters(parameters: ["":""], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
