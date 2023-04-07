//
//  NetworkProvider.swift
//  Generic_Network_Layer_RxMoya
//
//  Created by Ahmed Salem on 07/04/2023.
//

import Foundation
import RxSwift
import Moya


protocol NetworkProviderProtocol
{
    func readUserFromAPI() -> Single<[User]>
}

class NetworkProviderManager: NetworkProviderProtocol
{
    private let provider = MoyaProvider<UserServices>()
    
    func readUserFromAPI() -> Single<[User]> {
        return provider.rx.request(.readUsers)
            .filterSuccessfulStatusCodes()
            .map([User].self)
    }
    
     
    
   
}
