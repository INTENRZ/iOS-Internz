//
//  SigninViewController.swift
//  INTERNZ
//
//  Created by 최은지 on 27/12/2019.
//  Copyright © 2019 최은지. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var wholeView: UIView!
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var isCheckEmail:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "회원가입"
        loginButton.underline()
        
        nextButton.backgroundColor = UIColor.whiteFour
        nextButton.layer.cornerRadius = 5
        
        addKeyboardObserver()
        emailTextField.delegate = self
        
    }
    
    
    // 조건을 충족하였을 경우 다음 회원가입 뷰로 이동
    @IBAction func gotoNextSignin(_ sender: UIButton) {
        
        // 이메일을 입력하지 않았을 경우 -> 다음 뷰로 넘어가지 못함
        if self.emailTextField.text == "" {
            let alert = UIAlertController(title: "회원가입 실패!", message: "이메일을 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        // 비밀번호와 비밀번호 확인이 일치하지 않는 경우 -> 다음 뷰로 넘어가지 못함
        if self.passwordTextField.text != self.passwordConfirmTextField.text {
            let alert = UIAlertController(title: "회원가입 실패!", message: "비밀번호와 비밀번호 확인이 일치하는지 다시 확인해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        
        // 핸드폰 번호를 입력하지 않았을 경우 -> 다음 뷰로 넘어가지 못함
        if self.phoneTextField.text == "" {
            let alert = UIAlertController(title: "회원가입 실패!", message: "핸드폰 번호를 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        
        // 이메일 중복 체크
        SignupService.sharedSignup.emailCheck(self.emailTextField.text!) {
            response in
            
            switch response {
            case .success(let data):
                print("data???", data)
                self.isCheckEmail = data as! Bool
                print("checkEmail??? ", self.isCheckEmail)
                
                if self.isCheckEmail == true {
                    let alert = UIAlertController(title: "이메일 중복 없음!", message: "다음 회원가입 화면으로 넘어갑니다.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: {
                        action in
                        self.goNextSigninView();
                        return;
                    }))
                    
                    self.present(alert, animated: true)
                }
                
            case.networkFail:
                print("error") //찍어보기 확인
            case .requestErr(_):
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            }
        }
        
//        print("checkEmail2??? ", self.isCheckEmail)
        
        if self.isCheckEmail == false {
            let alert = UIAlertController(title: "이메일 중복!", message: "다른 이메일을 입력해주세요.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return
        }
        
        
        //        guard self.emailTextField.text != nil else { return }
        //        guard self.passwordTextField.text != nil else { return }
        //        guard self.passwordConfirmTextField.text != nil else { return }
        //        guard self.phoneTextField.text != nil else { return }
        
        //        let dvc = storyboard?.instantiateViewController(identifier: "Signin2ViewController") as! Signin2ViewController
        
        
        
        
        //        dvc.userEmailString = emailTextField.text
        //        dvc.userPwdString = passwordTextField.text
        //        dvc.userPwdConfirmString = passwordConfirmTextField.text
        //        dvc.phoneString = phoneTextField.text
        
        //        navigationController?.pushViewController(dvc, animated: true)
    }
    
    @IBAction func gotoLoginView(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func goNextSigninView(){
        let dvc = storyboard?.instantiateViewController(identifier: "Signin2ViewController") as! Signin2ViewController
   
        navigationController?.pushViewController(dvc, animated: true)
        return
    }
    
    
    
}

extension SigninViewController: UITextFieldDelegate{
    
}

extension SigninViewController {
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
            self.wholeView.transform = .init(translationX: 0, y: -50)
        })
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        UIView.animate(withDuration: duration, delay: 0, options: .init(rawValue: curve), animations: {
            self.wholeView.transform = .identity
        })
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

