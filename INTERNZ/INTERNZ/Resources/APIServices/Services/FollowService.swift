//
//  FollowService.swift
//  INTERNZ
//
//  Created by 최은지 on 03/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation
import Alamofire

struct FollowService {
    static let followShared = FollowService()
    
    // 팔로잉 조회
    func followingList(completion: @escaping (NetworkResult<Any>) -> Void){
        
        var token = UserDefaults.standard.value(forKey: "token") as! String
        
        let header: HTTPHeaders = [
            "Content-Type" : "applicatiton/json",
            "token" : token
        ]
        
        Alamofire.request(APIConstants.profileFollowingURL, method: .get, encoding: JSONEncoding.default, headers:
            header).responseJSON{
                response in
                
                // parameter 위치
                switch response.result {
                    
                // 통신 성공 - 네트워크 연결
                case .success:
                    if response.result.value != nil {
                        
                        if let status = response.response?.statusCode {
                            switch status {
                            case 200:
                                guard let data = response.data else { return }
//                                print("data????" , data)
                                
                                do {
                                    print("start decode")
                                    let decoder = JSONDecoder()
                                    let object = try decoder.decode(followResponseString.self, from: data)
//                                    print(object)
                                    
                                    if object.success == true {
                                        print("통신 성공 ~!!!")
                                        completion(.success(object.data))
                                    } else {
                                        print("통신 안 됨")
                                    }
                                    
                                } catch (let err){
                                    print(err.localizedDescription)
                                }
                            case 400:
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                            default:
                                break
                            }// switch
                        }// iflet
                    }
                    break
                    
                // 통신 실패 - 네트워크 연결
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                    print("통신failure")
                    // .networkFail이라는 반환 값이 넘어감
                    break
                } // response.result switch
        } // alamofire.request
    } // func followinglist
    
}
