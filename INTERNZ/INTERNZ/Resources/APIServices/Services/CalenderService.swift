//
//  CalenderService.swift
//  INTERNZ
//
//  Created by 최은지 on 01/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation
import Alamofire

struct CalenderService {
    
    static let calenderShared = CalenderService()
    
    
    func calenderList(completion: @escaping(NetworkResult<Any>) -> Void){
        
        var token = UserDefaults.standard.value(forKey: "token") as! String
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json",
            "token" : token
        ]
        
        Alamofire.request(APIConstants.calenderURL, method: .get, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                switch response.result {
                    
                case .success:
                    if let value = response.result.value {
                        if let status = response.response?.statusCode {
                            switch status {
                            case 200 :
                                guard let data = response.data else { return }
                                
                                do {
                                    let decoder = JSONDecoder()
                                    let object = try decoder.decode(calenderResponseString.self, from: data)
                                    
                                    if object.success == true {
                                        print("캘린더 조회 서버 통신 성공 ㅇㅅㅇ~!")
                                        completion(.success(object.data))
                                    } else {
                                        print("노 통신 ㅅㅂ")
                                    }
                                } catch {
                                    completion(.pathErr)
                                    print(error.localizedDescription)
                                }
                            case 400:
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                            default:
                                break
                            } // switch
                        } // if let
                    }
                    break
                    
                case .failure(let err):
                    print(err.localizedDescription)
                }
        }
    }
    
}
