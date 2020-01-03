//
//  TimelineListService.swift
//  INTERNZ
//
//  Created by 최은지 on 01/01/2020.
//  Copyright © 2020 최은지. All rights reserved.
//

import Foundation
import Alamofire

struct TimelineListService {
    
    static let timelineShared = TimelineListService()
    
    func timelineList(completion: @escaping(NetworkResult<Any>) -> Void ){
        
        var token = UserDefaults.standard.value(forKey: "token") as! String
        
        
        let header: HTTPHeaders = [
            "Content-Type" : "applicatiton/json",
            "token" : token
        ]
        
        Alamofire.request(APIConstants.profileTimelineURL, method: .post, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                switch response.result {
                    
                case .success:
                    if let value = response.result.value {
                        
                        if let status = response.response?.statusCode {
                            switch status {
                            case 200:
                                guard let data = response.data else { return }
                                print("status", status)
                                do {
                                    print("start decode")
                                    let decoder = JSONDecoder()
                                    let object = try decoder.decode(timelineResponseString.self, from: data)
                                    
                                    print("object", object)
                                    if object.success == true {
                                        print("성공~!~!")
                                        completion(.success(object.data))
                                    } else {
                                        print("ㅅㅂ 통신 노")
                                    }
                                    
                                   
                                }
                                catch {
                                    completion(.pathErr)
                                    print(error.localizedDescription)
                                    print(APIConstants.loginURL)
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
                    
                case .failure(let err):
                    print(err.localizedDescription)
                    
                }
        }
    } // func timelinelist
    
    func timelineStoryList(_ timelineIdx: Int,  completion: @escaping(NetworkResult<Any>) -> Void ){
        
        var token = UserDefaults.standard.value(forKey: "token") as! String
        
        let header: HTTPHeaders = [
            "Content-Type" : "applicatiton/json",
            "token" : token
        ]
        
        var timelineStoryURL = APIConstants.timelineStoryURL + String(timelineIdx) + "/story"
        print(timelineStoryURL)
        
        Alamofire.request(timelineStoryURL, method: .get, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                switch response.result {
                    
                case .success:
                    if let value = response.result.value {
                        
                        if let status = response.response?.statusCode {
                            switch status {
                            case 200:
                                guard let data = response.data else { return }
                                print("status", status)
                                do {
                                    print("data", String(data:value, encoding: .utf8))
                                    let decoder = JSONDecoder()
                                    let object = try decoder.decode(timelineStoryResponseString.self, from: data)
                                    
                                    print("object", object)
                                    if object.success == true {
                                        print("성공~!~!")
                                        completion(.success(object.data))
                                    } else {
                                        print("ㅅㅂ 통신 노")
                                    }
                                    
                                }
                                catch {
                                    completion(.pathErr)
                                    print(error.localizedDescription)
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
                    
                case .failure(let err):
                    print(err.localizedDescription)
                    
                }
        }
    } // func timeline story
    
    
}


