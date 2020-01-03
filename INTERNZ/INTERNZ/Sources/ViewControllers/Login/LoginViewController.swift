//
//  LoginViewController.swift
//  INTERNZ
//
//  Created by 박주연 on 25/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var idlineUIView: UIView!
    @IBOutlet weak var pwlineUIView: UIView!
    
    var isSuccessLogin :Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addKeyboardObserver()
        idTextField.delegate = self
        pwTextField.delegate = self
        
        self.loginButton.layer.cornerRadius = 5
        
        self.signupButton.underline()
    }
    
    @IBAction func goSigninView(_ sender: UIButton) {
        
        let signinStoryBoard:UIStoryboard = UIStoryboard(name: "Signin", bundle: nil)
        
        let dvc = signinStoryBoard.instantiateViewController(identifier: "SigninView") as! SigninViewController
        
        let navigationController = UINavigationController(rootViewController: dvc)
        
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func doLogin(_ sender: UIButton) {
        
        guard let email = idTextField.text else { return }
        guard let password = pwTextField.text else { return }
        
        LoginService.shared.login(email, password){
            data in
            switch data {
                
            case .success(let data):
                
                let user_data = data as! LoginDataClass
                
                UserDefaults.standard.set(user_data.token, forKey: "token")
                UserDefaults.standard.set(user_data.isFirst, forKey: "isFirst")
                
                var isFirstStr = UserDefaults.standard.value(forKey: "isFirst") as! String
                var token = UserDefaults.standard.value(forKey: "token") as! String
                
                if(isFirstStr == "0"){
                    print("처음 로그인")
                    self.goFirstLogin()
                    self.goMain()
                } else {
                    print("이미 로그인 해봄")
                    self.goMain()
                }
                
            case .requestErr(let message) :

                let alert = UIAlertController(title: "Login Failed!", message: "이메일과 비밀번호를 다시 확인해 주세요", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
                self.present(alert, animated: true)
                
                break
                
            case .pathErr:
                print(".pathErr")
                
            case .serverErr:
                print(".serverErr")
                
            case .networkFail:
                print(".networkFail")
                break
                
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func goMain(){
        let MainStoryBoard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let dvc = MainStoryBoard.instantiateViewController(identifier: "Main") as! TabbarViewController
        
        dvc.modalPresentationStyle = .fullScreen
        self.present(dvc, animated: true, completion: nil)
    }
    
    func goFirstLogin(){
        let firstLoginStoryBoard:UIStoryboard = UIStoryboard(name: "FirstLogin", bundle: nil)
        
        let dvc = firstLoginStoryBoard.instantiateViewController(identifier: "FirstLogin") as! SettingFavorViewController
        
        let navigationController = UINavigationController(rootViewController: dvc)
        
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField {
            idlineUIView.backgroundColor = .marigold
        }
        
        if textField == pwTextField {
            pwlineUIView.backgroundColor = .marigold
        }
        
        if self.idTextField.text != "" || self.pwTextField.text != "" {
            
            self.loginButton.backgroundColor = .marigold
            
        }
        
        
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == idTextField {
            idlineUIView.backgroundColor = .whiteFour
        }
        
        if textField == pwTextField {
            pwlineUIView.backgroundColor = .whiteFour
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        //        print("did change selection")
    }
}

extension LoginViewController {
    
    // 옵저버 패턴 활용 TextField 가리는 문제 해결
    private func addKeyboardObserver() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func closeKeyboardObserver(){
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.backgroundView.transform = .init(translationX: 0, y: -100)
        })
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.backgroundView.transform = .identity
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
