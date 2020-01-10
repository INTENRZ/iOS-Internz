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
    
    static let sharedSignup = SignupService()
    
    // 이메일 중복 체크
    func emailCheck(_ email:String, completion: @escaping(NetworkResult<Any>) -> Void){
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email" : email
        ]
        
        Alamofire.request(APIConstants.Signup1URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                switch response.result {
                    
                case .success: // 통신 성공
                    
                    if let value = response.result.value {
                        if let status = response.response?.statusCode {
                            switch status {
                            case 200:
                                do{
                                    let decoder = JSONDecoder()
                                    let result = try decoder.decode(EmailCheckResponseString.self, from: value)
                                    
                                    switch result.success {
                                        
                                    case true: // 이메일 중복이 없는 경우
                                        print("이메일 중복 체크!!")
                                        completion(.success(result.success))
                                    case false:
                                        print("fail,,")
//                                        completion(.success(result.success))
                                        completion(.requestErr(result.message))
                                    }
                                    
                                } catch {
                                    print(error.localizedDescription)
                                }
                            case 330:
                                print("이메일중복")
                            case 400:
                                completion(.pathErr)
                            case 500:
                                completion(.serverErr)
                            default:
                                break
                            }
                        }
                    }
                    
                case .failure(let err) : // 통신 실패
                    print(err.localizedDescription)
                }
        }
    } // emailCheck Func
    
    
    // 회원가입
    func signup(_ email:String, _ password: String, _ password2: String, _ phone: String, _ name: String, _ nickname:String, _ age:String, _ sex: String, completion: @escaping(NetworkResult<Any>) -> Void) {
        
        let header: HTTPHeaders = [
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            "email" : email,
            "password": password,
            "password2": password2,
            "phone" : phone,
            "name": name,
            "nickname" : nickname,
            "age": age,
            "sex": sex
        ]
        
        Alamofire.request(APIConstants.Signup2URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
            .responseData { response in
                
                switch response.result {
                    
                case .success:
                    if let value = response.result.value {
                        
                        if let status = response.response?.statusCode {
                            switch status {
                            case 200:
                                do {
                                    let decoder = JSONDecoder()
                                    print("value", value)
                                    let result = try decoder.decode(SignupResponseString
                                        .self, from: value)
                                    print(result)
                                    
                                    switch result.success {
                                    case true:
                                        print("success")
                                        completion(.success(result.success))
//                                        completion(.success(result.data)) // NetworkResult 에서 접근
                                    case false:
                                        completion(.requestErr(result.success))
//                                        completion(.requestErr(result.message))
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
                    
                // 네트워크 통신 실패
                case .failure(let err):
                    print(err.localizedDescription)
                    completion(.networkFail)
                    break
                    
                }
        }
    } // signup func
    
}
