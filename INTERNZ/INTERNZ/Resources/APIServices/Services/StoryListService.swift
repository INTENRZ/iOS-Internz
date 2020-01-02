//
//  StoryListService.swift
//  INTERNZ
//
//  Created by 박주연 on 31/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import Alamofire

//enum NetworkResult3<T, Error>{
//    case success(T)
//    case failure(Error)
//}

class StoryListService{
    
    static let shared = StoryListService()
    
    // 스토리 최신순 조회
    func StoryList(completion: @escaping (NetworkResult<Any>) -> Void){
        
        let header: HTTPHeaders = [
            "Content-Type" : "/application/json"
        ]
        
        let storyNewURL = APIConstants.storyNewURL
        
        Alamofire.request(storyNewURL).responseJSON{
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
                            
                            do {
                                let decoder = JSONDecoder()
                                let object = try decoder.decode(StoryResponseString.self, from: data)
                                
                                if object.success == true {
                                    print("통신 성공 ~!!!")
                                    completion(.success(object.data))
                                } else {
                                    print("통신 안 됨")
                                }
                                
                            } catch (let err){
                                print(err.localizedDescription)
                                //                                completion(.failure(err))
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
    } // func storylist
    
    
    // 스토리 조회순 조회
    func StoryCountList(completion: @escaping (NetworkResult<Any>) -> Void){
        
        let header: HTTPHeaders = [
            "Content-Type" : "/application/json"]
        
        let storyCountURL = APIConstants.storyCountURL
        
        Alamofire.request(storyCountURL).responseJSON{
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
                            
                            do {
                                let decoder = JSONDecoder()
                                let object = try decoder.decode(StoryResponseString.self, from: data)
                                
                                if object.success == true {
                                    print("통신 성공 ~!!!")
                                    completion(.success(object.data))
                                } else {
                                    print("통신 안 됨")
                                }
                                
                            } catch (let err){
                                print(err.localizedDescription)
                                //                                completion(.failure(err))
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
    } // func storylist
    
    
    // 스토리 상세 내용 조회
    func StoryDetail(_ storyIdx: Int, completion: @escaping (NetworkResult<Any>) -> Void){
        
        var token = UserDefaults.standard.value(forKey: "token") as! String

        let header: HTTPHeaders = [
            "Content-Type" : "applicatiton/json",
            "token" : token
        ]
        
        
        let storyDetailURL = APIConstants.storyDetailURL + "\(storyIdx)"
        
        
//        Alamofire.request(APIConstants.profileTimelineURL, method: .post, encoding: JSONEncoding.default, headers: header)
        
        Alamofire.request(storyDetailURL, method: .get, encoding: JSONEncoding.default, headers:
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
                            
                            do {
                                let decoder = JSONDecoder()
                                let object = try decoder.decode(storyDetailResponseString.self, from: data)
                                print(object)
                                
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
    } // func storyDetail
    
} // struct

