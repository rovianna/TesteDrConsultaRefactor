//
//  File.swift
//  TesteDrConsultaRefactor
//
//  Created by Rodrigo Vianna on 06/07/18.
//  Copyright © 2018 Rodrigo Vianna. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

typealias callback = ((ResponseWrapper<Any>) -> Void)

enum Result<Value> {
    case sucess(Value)
    case failure(Error)
}

struct ResponseWrapper<T> {
    var result: Result<T>
}

class GameRequesterData {
    
    static let shared = GameRequesterData()
    
    struct EnviromentData {
        let host: String
        let client_id: String
    }
    
    var enviroment: EnviromentData {
        return EnviromentData(host: "https://api.twitch.tv/kraken", client_id: "38fpvmn9c12eceohdf0dcaf8x4huwj")
    }
}

class BaseRequester {
    static let shared = BaseRequester()
    
    func baseRequest(path: String, httpMethod: HTTPMethod, completion: @escaping callback){
        if let pathRequest = URL(string: "\(GameRequesterData.shared.enviroment.host)/\(path)") {
            let httpHeader : Alamofire.HTTPHeaders = ["Client-ID" : GameRequesterData.shared.enviroment.client_id]
            Alamofire.request(pathRequest, method: httpMethod, parameters: nil, encoding: JSONEncoding.default, headers: httpHeader).responseJSON { (response) in
                switch response.result {
                case .failure(let error):
                    let wrapper = ResponseWrapper<Any>(result: Result.failure(error))
                    completion(wrapper)
                case .success(let data): let wrapper = ResponseWrapper<Any>(result: Result.sucess(data))
                completion(wrapper)
                }
            }
        }
    }
}

class GameRequester {    
    func getTopGames(limit: Int = 25, completion: @escaping (Result<[Game]>)-> Void){
        let path = "games/top?limit=\(limit)"
        BaseRequester.shared.baseRequest(path: path, httpMethod: .get) { (response) in
            switch response.result {
            case .sucess(let data):
                let gamesJSON = JSON(data)
                let games = gamesJSON["top"].arrayValue.compactMap{Game.init(withJson: $0)}
                DispatchQueue.main.async {
                 completion(Result.sucess(games))
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(Result.failure(error))
                }
            }
        }
    }
}
