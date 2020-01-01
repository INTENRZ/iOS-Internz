//
//  SigninService.swift
//  INTERNZ
//
//  Created by 최은지 on 30/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import Foundation
import Alamofire

class SignupService{
    
    static let shared = SignupService()
    
    func signup(_ email:String, _ password: String, _ phone: String, _ name: String, _ nickname:String, _ age:String, _ sex: String, completion: @escaping(NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type" : "/application/json"
        ]
        
        let body: Parameters = [
            "name": name,
            "nickname" : nickname,
            "age": age,
            "sex": sex
        ]
        
        //        let url = APIConstants.Signup2URL
        
        Alamofire.request(APIConstants.Signup2URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                // parameter 위치
                switch response.result {
                    
                // 통신 성공 - 네트워크 연결
                case .success:
                    if let value = response.result.value {
                        
                        if let status = response.response?.statusCode {
                            switch status {
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    print("value", value)
                                    let result = try decoder.decode(loginResponseString.self, from: value)
                                    
                                    // ResponseString2에 있는 success로 분기 처리
                                    switch result.success {
                                        
                                    case true: // 진짜 로그인 성공인 경우
                                        print("success")
                                        completion(.success(result.data)) // NetworkResult 에서 접근
                                    case false:
                                        completion(.requestErr(result.message))
                                    }
                                }
                                catch {
                                    completion(.pathErr)
                                    print(error.localizedDescription)
                                    print(APIConstants.loginURL)
                                    print("존재하는 닉네임")
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
                    
                    
                // 네트워크 통신 실패
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                    break
                    
                }
        }
        
    }
    
}
