//
//  ViewController.swift
//  Generic_Network_Layer_RxMoya
//
//  Created by Ahmed Salem on 07/04/2023.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        let provider : NetworkProviderProtocol = NetworkProviderManager()
        
        provider.readUserFromAPI().asObservable().subscribe(onNext: { users in
            print(users)
        },onError: { error in
            print(error.localizedDescription)
            
        },onCompleted: {
            print("Mission Successfully Completed.")
        }
        ).disposed(by: disposeBag)
    }


}

