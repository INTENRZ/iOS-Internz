//
//  JobService.swift
//  INTERNZ
//
//  Created by 최은지 on 30/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkResult2<T, Error> {
    case success(T)
    case failure(Error)
}

class JobListService {
    private init() { }
    
    static let sharedJob = JobListService()
    
    // 최신순 공고 조회
    func getJobList(completion: @escaping (NetworkResult2<[jobResponseString
        .JobDataClass], Error>) -> Void) {
        
        let url = APIConstants.jobURL
        
        Alamofire.request(url).responseJSON {
            response in
            switch response.result {
            case .success :
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(jobResponseString.self, from: data)
                    
                    if object.status == 200 {
                        print("통신 성공 ~!!!")
                        completion(.success(object.data))
                    } else {
                        completion(.failure(fatalError("서버 통신 오류 ㅡㅡ ")))
                    }
                    
                } catch (let err){
                    print(err.localizedDescription)
                    completion(.failure(err))
                }
                
            case .failure :
                print("failure")
            }
        }
        
    } // getJobList
    
    
    // 지난 공고 조회
    func getPastJobList(completion: @escaping (NetworkResult2<[jobResponseString
        .JobDataClass], Error>) -> Void) {
        
        let url = APIConstants.jobPastURL
        
        Alamofire.request(url).responseJSON {
            response in
            switch response.result {
            case .success :
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let object = try decoder.decode(jobResponseString.self, from: data)
                    
                    if object.status == 200 {
                        print("통신 성공 ~!!!")
                        completion(.success(object.data))
                    } else {
                        completion(.failure(fatalError("서버 통신 오류 ㅡㅡ ")))
                    }
                    
                } catch (let err){
                    print(err.localizedDescription)
                    completion(.failure(err))
                }
                
            case .failure :
                print("failure")
            }
        }
        
    } // getJobList
    
    
    
}

