//
//  GithubReposEndpoint.swift
//  Collection2sections
//
//  Created by gustavo.cosenza on 01/07/21.
//

import Foundation

class GithubReposEndpoint: EndpointProtocol {
    var scheme: EndpointScheme {
        return .https
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var host: String {
        return "api.github.com"
    }
    
    var path: String {
        return "/users/gucosenza/repos"
    }
    
    
    var parameters: [URLQueryItem] {
        return []
    }
    
    
//    https://api.github.com/users/gucosenza/repos
}
